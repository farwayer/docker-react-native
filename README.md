Docker image based on archlinux for building react-native apps. It also contains
android platforms and build-tools for most popular react-native addons. 

All package versions are recent, unless otherwise specified.

## Packages

- nodejs
- yarn
- npm
- watchman
- openjdk8
- git
- fastlane
- ruby (for fastlane)
- python2 (for building some npm deps)
- make (for building some npm deps)
- gcc (for building some npm deps)

## Android

### SDK

- latest

### Platform tools

- latest

### Platforms

- **23** (code-push, push-notification, blur, smart-splash-screen, fabric,
react-swipeable-views, device-info, gl-react-native, fetch-blob, nachos-ui)
- **24** (material-kit, gl-react)
- **25** (maps, navigation, camera, video, native-navigation, svg, fbsdk, fcm)
- **26**

### Build tools

- **23.0.1** (code-push, push-notification, fbsdk, fabric, gl-react-native,
react-swipeable-views, fetch-blob, nachos-ui)
- **23.0.3** (material-kit, blur, smart-splash-screen)
- **24.0.3** (gl-react)
- **25.0.1** (navigation, svg)
- **25.0.2** (camera, video, native-navigation, device-info, fcm)
- **25.0.3** (maps)
- **26.0.1**

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

### Google repository

- latest

### Fastlane

You should use [fastlane](https://fastlane.tools/). It's really cool!

### Installing extra packages

Archlinux packages can be found [here](https://www.archlinux.org/packages/)
```bash
pacman -Sy && pacman -S android-udev
```

Some extra packages for mobile development (android-ndk etc.) are available
[here](https://keybase.pub/farwayer/arch/mobile/)
```bash
pacman -Sy && pacman -S android-ndk
```