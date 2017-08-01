Docker image for building react-native apps based on archlinux. Contains
android platforms and build-tools for most popular react-native addons. 

All package versions are recent, unless otherwise specified.

## Packages

- nodejs
- yarn
- npm
- watchman
- openjdk-8
- python2 (for building some npm deps)
- ruby (for fastlane)
- make (for building some npm deps)
- gcc (for building some npm deps)
- git
- fastlane

## Android

### SDK

- latest

## Platform tools

- latest

### Platforms

- android-platform-23 (code-push, push-notification, blur, smart-splash-screen,
react-swipeable-views, device-info, gl-react-native, fetch-blob, fabric,
nachos-ui)
- android-platform-24 (material-kit, gl-react)
- android-platform-25 (maps, navigation, camera, video, native-navigation, svg,
fbsdk, fcm)
- android-platform-26

### Build tools

- android-sdk-build-tools-23.0.1 (code-push, push-notification, fbsdk, fabric,
react-swipeable-views, gl-react-native, fetch-blob, nachos-ui)
- android-sdk-build-tools-23.0.3 (material-kit, blur, smart-splash-screen)
- android-sdk-build-tools-24.0.3 (gl-react)
- android-sdk-build-tools-25.0.1 (navigation, svg)
- android-sdk-build-tools-25.0.2 (camera, video, native-navigation, device-info,
fcm)
- android-sdk-build-tools-25.0.3 (maps)
- android-sdk-build-tools-26.0.1

### Support library

Support library is available in Google maven repository now. Simply add this
to `android/build.gradle`:
```
allprojects {
    repositories {
        ...
        maven { url 'https://maven.google.com' }
        ...
    }
}
```

### Extra libs (not available in maven)

- android-google-repository

## Extra

### Fastlane

You should use [fastlane](https://fastlane.tools/). It's really cool!
