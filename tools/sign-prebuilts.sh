# Copyright (c) 2014 David Black. Licensed as CCBYSA
# See https://gitorious.org/asdgasd/my-fdroiddata

# This is for signing (and installing) prebuilt apks via fdroid
# as long as the repo has been imported via fdroid.
# If the fdroid import fails, and the build is done from tmp/importer
# to avoid dowloading the repo again, then set PNAME to the package
# name manually before running this.
# Delete all but one apks first.

#! /bin/bash

#PNAME=`basename $PWD`
PNAME="${PWD##*/}"
#PNAME="com.example.package"
cp $(find . -name \*.apk) ~/fdroiddata/unsigned/$PNAME\_0.apk
cd ~/fdroiddata/
touch unsigned/$PNAME\_0\_src.tar.gz
cp -n templates/minimal.txt metadata/$PNAME.txt
rm repo/$PNAME\_0.apk
fdroid publish $PNAME
rm repo/$PNAME\_0\_src.tar.gz
#adb install -r repo/$PNAME\_0.apk
cd build/$PNAME

