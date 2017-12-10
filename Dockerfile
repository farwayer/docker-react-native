FROM pritunl/archlinux
MAINTAINER farwayer <farwayer@gmail.com>

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
'Server=https://farwayer.keybase.pub/arch/$repo' >> /etc/pacman.conf
RUN pacman-key --init
RUN pacman-key --keyserver ha.pool.sks-keyservers.net -r 7943315502A936D7
RUN pacman-key --lsign-key 7943315502A936D7
RUN pacman --noconfirm -Sy yarn npm watchman jdk8-openjdk git\
 android-platform-23\
 android-sdk-build-tools-23.0.1\
 && yes | pacman -Scc\
 && rm -rf /usr/share/{doc,man,locale}\
 && mkdir /var/run/watchman
ENV ANDROID_HOME=/opt/android-sdk
