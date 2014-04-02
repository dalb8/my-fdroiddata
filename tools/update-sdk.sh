#! /bin/bash
# Updating the SDK
# The -a flag appears to behave like forcing as well as choosing deprecated, so it will 
# re-download and re-install items: use it if it says 'incorrect filter'
# See https://code.google.com/p/android/issues/detail?id=58337
# Best to check first with ~>android list target
echo y | android update sdk --filter tools,platform-tools,build-tools-19.0.3,android-19,extra-android-support,extra-android-m2repository --no-ui --force

# Reminder if one is using x86_64
#sudo apt-get update
#sudo apt-get install -qq --force-yes libgd2-xpm ia32-libs ia32-libs-multiarch
#wget http://dl.google.com/android/android-sdk_r22.3-linux.tgz
#wget http://dl.google.com/android/ndk/android-ndk-r9-linux-x86_64.tar.bz2
#tar xf android-sdk_r22.3-linux.tgz
#tar xf android-ndk-r9-linux-x86_64.tar.bz2
#export PATH=`pwd`/android-ndk-r9:`pwd`/android-sdk-linux/tools:`pwd`/android-sdk-linux/platform-tools:$PATH

