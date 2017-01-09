FROM pritunl/archlinux
MAINTAINER farwayer <farwayer@gmail.com>

COPY pacman.conf /etc/
RUN pacman -Sy && pacman --noconfirm -S yaourt sudo fakeroot
RUN printf "nobody ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN sudo -u nobody yaourt --noconfirm -S nodejs yarn jdk8-openjdk \
  android-platform android-support-repository android-sdk-build-tools \
  android-platform-23 android-sdk-build-tools-23.0.1
