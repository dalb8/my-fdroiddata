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
#PNAME="com.example.package"
PNAME="${PWD##*/}"
export DATE=$(date +%d%m%Y)
cp $(find . -name \*.apk) ~/fdroiddata/unsigned/$PNAME\_00$DATE.apk
cd ~/fdroiddata/
#touch unsigned/$PNAME\_00$DATE\_src.tar.gz
cp -n templates/minimal.txt metadata/$PNAME.txt
fdroid publish $PNAME
#rm repo/$PNAME\_00$DATE\_src.tar.gz
#adb install -r repo/$PNAME\_00$DATE.apk
cd build/$PNAME

