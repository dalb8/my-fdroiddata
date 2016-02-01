# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# Like sign-prebuilts.sh but more for new apps that we want to try out.
# For signing and running any self-built APK of debug or release type.
# First argument is the APK, second is the activity
#! /bin/bash

PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
NAME=$(echo "$(aapt d badging "$1" |grep 'application:')")
PERMISSIONS=$(echo "$(aapt d badging "$1" |grep 'uses-permission:')")
VERCODE=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionCode='\([0-9]*\)'.*/\1/")

echo "Installing $PNAME"
cp "$1" $MYFDROIDDATA/tmp/$PNAME\_$VERCODE.apk
cd $MYFDROIDDATA
cp tmp/$PNAME\_$VERCODE.apk tmp/signed.apk
echo "Signing with debug key:"
echo android | jarsigner -keystore ~/.android/debug.keystore -digestalg SHA1 -sigalg SHA1withRSA tmp/signed.apk androiddebugkey
zipalign -f 4 tmp/signed.apk tmp/aligned.apk
adb install -r tmp/aligned.apk
echo -e "Uses Permissions:\n$PERMISSIONS"
echo "Run? (Press Enter)"
read
echo "Running $NAME"
adb shell monkey -p $PNAME 1
echo "Uninstall? (Press Enter)"
read
adb uninstall $PNAME
adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME
echo "Add to repo? (Press Enter)"
read
if [ -e $MYFDROIDDATA/repo/$PNAME\_$VERCODE.apk ]; then
	echo The repo already has an APK with that name.
else
        zip -d tmp/$PNAME\_$VERCODE.apk META-INF/*
        mv tmp/$PNAME\_$VERCODE.apk unsigned/
        touch unsigned/$PNAME\_$VERCODE\_src.tar.gz
        cp -n templates/minimal.txt metadata/$PNAME.txt
        fdroid publish $PNAME
fi

