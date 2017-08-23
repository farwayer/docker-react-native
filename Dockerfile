FROM pritunl/archlinux:2017-08-19
MAINTAINER farwayer <farwayer@gmail.com>

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
'Server=https://farwayer.keybase.pub/arch/$repo' >> /etc/pacman.conf
RUN pacman-key --keyserver na.pool.sks-keyservers.net -r 7943315502A936D7\
 && pacman-key --lsign-key 7943315502A936D7
RUN pacman -Sy && pacman --noconfirm -S yarn npm watchman jdk8-openjdk\
 fastlane python2 make gcc git\
 android-platform android-platform-23 android-platform-24 android-platform-25\
 android-sdk-build-tools android-sdk-build-tools-23.0.1\
 android-sdk-build-tools-23.0.3 android-sdk-build-tools-24.0.3\
 android-sdk-build-tools-25.0.1 android-sdk-build-tools-25.0.2\
 android-sdk-build-tools-25.0.3\
 android-google-repository\
 && yes | pacman -Scc && rm -rf /usr/lib/ruby/gems/*/{cache,doc}\
 /usr/share/{doc,man,locale} && mkdir /var/run/watchman
ENV ANDROID_HOME=/opt/android-sdk
