FROM archlinux/base
MAINTAINER farwayer <farwayer@gmail.com>

# Make pacman to use wget for more reliable downloads
RUN pacman --noconfirm -Sy wget
RUN sed -i 's/#VerbosePkgLists/XferCommand = \/usr\/bin\/wget -nv -c -O %o %u/g' /etc/pacman.conf

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
"SigLevel = Never\n"\
'Server=https://farwayer.keybase.pub/arch/$repo' >> /etc/pacman.conf
RUN pacman --noconfirm --disable-download-timeout -Sy\
 yarn npm watchman jdk8-openjdk git procps-ng\
 fastlane python2 make gcc\
 android-platform-23\
 android-platform-24\
 android-platform-25\
 android-platform-26\
 android-platform-27\
 android-platform-28\
 android-sdk-build-tools-23.0.1\
 android-sdk-build-tools-23.0.3\
 android-sdk-build-tools-25\
 android-sdk-build-tools-25.0.2\
 android-sdk-build-tools-25.0.3\
 android-sdk-build-tools-26.0.1\
 android-sdk-build-tools-26.0.2\
 android-sdk-build-tools-26.0.3\
 android-sdk-build-tools-27.0.3\
 android-sdk-build-tools-28.0.2\
 android-sdk-build-tools-28.0.3\
 android-google-repository\
 android-support-repository\
 && yes | pacman -Scc || true\
 && rm -rf /usr/lib/ruby/gems/*/{cache,doc} /usr/share/{doc,man,locale}
ENV ANDROID_HOME=/opt/android-sdk
