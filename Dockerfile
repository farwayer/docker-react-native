FROM pritunl/archlinux:2018-08-11
MAINTAINER farwayer <farwayer@gmail.com>

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
"SigLevel = Never\n"\
'Server=https://farwayer.keybase.pub/arch/$repo' >> /etc/pacman.conf
RUN pacman --noconfirm -Sy yarn npm watchman jdk8-openjdk git\
 android-platform-26\
 android-sdk-build-tools-26.0.3\
 && yes | pacman -Scc\
 && rm -rf /usr/share/{doc,man,locale}\
 && mkdir /var/run/watchman
ENV ANDROID_HOME=/opt/android-sdk
