PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
NAME=$(echo "$(aapt d badging "$1" |grep 'application:')")
PERMISSIONS=$(echo "$(aapt d badging "$1" |grep 'uses-permission:')")
echo "Installing $PNAME"
cp "$1" $MYFDROIDDATA/tmp/temp.apk
cd $MYFDROIDDATA/tmp
echo "Signing with debug key using default password:"
echo android | jarsigner -keystore ~/.android/debug.keystore -digestalg SHA1 -sigalg SHA1withRSA temp.apk androiddebugkey
zipalign -f 4 temp.apk aligned.apk
adb install -r aligned.apk
echo -e "Uses Permissions:\n$PERMISSIONS"
echo "Run? (Press Enter)"
read
echo "Running $NAME"
adb shell am start -n $PNAME/$PNAME."$2"
echo "Uninstall? (Press Enter)"
read
adb uninstall $PNAME
adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME

