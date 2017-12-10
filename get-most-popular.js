const {ApolloClient} = require('apollo-client');
const {HttpLink} = require('apollo-link-http');
const {InMemoryCache} = require('apollo-cache-inmemory');
const gql = require('graphql-tag');
const fetch = require('node-fetch');
const {map} = require('async-parallel');
const g2js = require('gradle-to-js/lib/parser');
const groupBy = require('lodash.groupby');


const authTokel = process.env.AUTH_TOKEN;

const client = new ApolloClient({
  link: new HttpLink({uri: 'https://api.github.com/graphql', fetch, headers: {
    Authorization: `bearer ${authTokel}`,
  }}),
  cache: new InMemoryCache(),
});

(async function mostPopular() {
  const {data: {search: {nodes}}} = await client.query({
    query: gql`
    query {
      search(type: REPOSITORY, query: "react-native stars:>500", first: 100) {
        nodes {
          ... on Repository {
            name
            module: object(expression: "master:android/build.gradle") {
              ... on Blob {
                text
              }
            }
            app: object(expression: "master:android/app/build.gradle") {
              ... on Blob {
                text
              }
            }
          }
        }
      }
    }`,
  });
  const projects = (await map(nodes, async node => {
    const {app, module} = node;
    const gradle = app || module;
    if (!gradle) return;

    const {android} = await g2js.parseText(gradle.text);
    if (!android) return;

    const {compileSdkVersion="", buildToolsVersion=""} = android;
    const platform = compileSdkVersion.replace(/[^\d]/g, '');
    const buildTools = buildToolsVersion.replace(/[^\d\.]/g, '');
    if (!platform && !buildTools) return;

    const name = node.name.replace(/react-native-|-react-native/, '');

    return {platform, buildTools, name}
  })).filter(project => project);

  const platforms = groupBy(projects, ({platform}) => platform);
  const buildTools = groupBy(projects, ({buildTools}) => buildTools);

  // TODO: autoupdate readme and Dockerfile
  console.log('### Platforms\n');
  printVersions(platforms);

  console.log('\n### SDK build tools\n');
  printVersions(buildTools);
})();

function printVersions(versions) {
  Object.entries(versions)
    .sort(([v1], [v2]) => v1 > v2 ? 1 : v2 > v1 ? -1 : 0)
    .forEach(([v, projects]) => {
      const projectNames = projects.map(({name}) => name).join(', ');
      console.log(`- **${v}** (${projectNames})`);
    });
}
