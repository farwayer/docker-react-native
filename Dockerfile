FROM archlinux/base
LABEL description="Environment for building React Native apps for Android"
LABEL maintainer="Tuomas Jaakola <tuomas.jaakola@iki.fi>"

# Make pacman to use wget for more reliable downloads
RUN pacman --noconfirm -Sy wget
RUN sed -i 's/#VerbosePkgLists/XferCommand = \/usr\/bin\/wget -nv -c -O %o %u/g' /etc/pacman.conf

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
"SigLevel = Never\n"\
'Server=https://farwayer.keybase.pub/arch/$repo' >> /etc/pacman.conf

# Install packages
# android-sdk-build-tools should come with android-platform pkg
RUN pacman --noconfirm --disable-download-timeout -Sy\
 yarn npm watchman jdk8-openjdk git procps-ng\
 python2 make gcc\
 android-platform-29\
 android-google-repository\
 android-support-repository\
 && yes | pacman -Scc || true\
 && rm -rf /usr/lib/ruby/gems/*/{cache,doc} /usr/share/{doc,man,locale}
ENV ANDROID_HOME=/opt/android-sdk

# Accepting all Android SDK package licenses is required
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
