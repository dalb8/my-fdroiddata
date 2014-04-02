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

#! /bin/bash

PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
VERCODE=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionCode='\([0-9]*\)'.*/\1/")

if [ -e $MYFDROIDDATA/repo/$PNAME\_$VERCODE.apk ]; then
	echo The repo already has an APK with that name.
else
        cp "$1" $MYFDROIDDATA/unsigned/$PNAME\_$VERCODE.apk
        cd $MYFDROIDDATA
        touch unsigned/$PNAME\_$VERCODE\_src.tar.gz
        cp -n templates/minimal.txt metadata/$PNAME.txt
        fdroid publish $PNAME
fi

