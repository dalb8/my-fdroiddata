## Originally published at https://gitorious.org/asdgasd/my-fdroiddata.
# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# This is for signing (and zip-aligning) prebuilt APKs via fdroid
# (whether they're signed already or not).
# Note the fdroid otherwise deletes APKs that don't have a
# metadata file.

# TODO: behave nicely when the apk already exists in repo/

#! /bin/bash

#PNAME="${PWD##*/}"
PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
export DATE=$(date +%d%m%Y)
cp "$1" $MYFDROIDDATA/unsigned/$PNAME\_00$DATE.apk
cd $MYFDROIDDATA
touch unsigned/$PNAME\_00$DATE\_src.tar.gz
cp -n templates/minimal.txt metadata/$PNAME.txt
fdroid publish $PNAME
#adb install -r repo/$PNAME\_00$DATE.apk

