# Like sign-prebuilts.sh but more for new apps that we want to try out.
# For signing and running any self-built APK of debug or release type.
# First argument is the APK, second is the activity
#! /bin/bash

PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
NAME=$(echo "$(aapt d badging "$1" |grep 'application:')")
PERMISSIONS=$(echo "$(aapt d badging "$1" |grep 'uses-permission:')")
DATE=$(date +%d%m%Y)

echo "Installing $PNAME"
mv "$1" $MYFDROIDDATA/tmp/$PNAME\_00$DATE.apk
cd $MYFDROIDDATA
cp tmp/$PNAME\_00$DATE.apk tmp/temp.apk
echo "Signing with debug key:"
echo android | jarsigner -keystore ~/.android/debug.keystore -digestalg SHA1 -sigalg SHA1withRSA tmp/temp.apk androiddebugkey
zipalign -f 4 tmp/temp.apk tmp/aligned.apk
adb install -r tmp/aligned.apk
echo -e "Uses Permissions:\n$PERMISSIONS"
echo "Run? (Press Enter)"
read
echo "Running $NAME"
adb shell am start -n $PNAME/$PNAME."$2"
echo "Uninstall? (Press Enter)"
read
adb uninstall $PNAME
adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME
echo "Add to repo? (Press Enter)"
read
cp -n templates/minimal.txt metadata/$PNAME.txt
mv tmp/$PNAME\_00$DATE.apk unsigned/
touch unsigned/$PNAME\_00$DATE\_src.tar.gz
fdroid publish $PNAME

