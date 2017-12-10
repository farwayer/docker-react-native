React Native builder (android) based on Arch Linux. Android platforms and sdk build tools for most popular react-native modules included.

There are two versions of builder: `-min` and full which contains more android platforms and sdk build tools.  

## Both images

### Android SDK

- **latest**

### Android platform tools

- **latest**

## Minimal image (-min)

Contains only required packages for building basic projects with no third-party modules. In most cases you will need to install extra `platforms` and `sdk build tools` with `pacman` or use this image as basic for your own image. 

### Packages

All package versions are recent for building date.

- **nodejs**
- **yarn**
- **npm**
- **watchman**
- **openjdk8**
- **git**

### Platforms

- **23**

### SDK build tools

- **23.0.1**

You can install extra sdk build tools with pacman:
```bash
pacman --noconfirm -Sy android-sdk-build-tools-26.0.3
```
(x.0.0 is named `android-sdk-build-tools-x`)

### Support library

Support library is available in Google maven repository now. Simply add this repository to `android/build.gradle`:
```
allprojects {
    repositories {
        ...
        maven { url 'https://maven.google.com' }
        ...
    }
}
```  

...or install with pacman:
```bash
pacman --noconfirm -Sy android-support-repository
```

### Google repository

Install with pacman:
```bash
pacman --noconfirm -Sy android-google-repository
```


## Full image

Contains much more android platforms, sdk build tools and compilers for npm native modules.

### Packages

All package versions are recent for building date.

- **nodejs**
- **yarn**
- **npm**
- **watchman**
- **openjdk8**
- **git**
- **fastlane**
- **ruby (for fastlane)**
- **python2 (for building some npm deps)**
- **make (for building some npm deps)**
- **gcc (for building some npm deps)**

### Platforms

- **23**
- **24**
- **25**
- **26**
- **latest**

### SDK build tools

- **23.0.1**
- **23.0.3**
- **25.0.0**
- **25.0.1**
- **25.0.2**
- **25.0.3**
- **26.0.1**
- **26.0.2**
- **latest**  

You can install extra sdk build tools with pacman:
```bash
pacman --noconfirm -Sy android-sdk-build-tools-26.0.3
```
(x.0.0 is named `android-sdk-build-tools-x`)

### Support library

- **latest**

### Google repository

- **latest**

### Fastlane

You should use [fastlane](https://fastlane.tools/). It's really cool!


## Installing extra packages

Archlinux packages can be found [here](https://www.archlinux.org/packages/)
```bash
pacman --noconfirm -Sy android-udev
```  

Some extra packages for mobile development (android-ndk etc.) are available [here](https://keybase.pub/farwayer/arch/mobile/)
```bash
pacman --noconfirm -Sy react-native-cli android-ndk
```
