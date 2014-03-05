#! /bin/bash
# Copyright (c) 2014 David Black. Licensed as CCBYSA
# See https://gitorious.org/asdgasd/my-fdroiddata

# Extract some useful info from an APK and write it to a metadata file
# Would use instead of fdroid update -c

PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
LABEL=$(echo "$(aapt d badging "$1" |grep -m 1 'application-label')" | awk -F"application-label='|'" '{print $2}')
CV=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionName='\(.*\)'.*/\1/")
CVC=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionCode='\([0-9]*\)'.*/\1/")
echo "Writing to metadata/$PNAME.txt"
cp -n templates/minimal.txt metadata/$PNAME.txt
sed -i '/Repo:/d;/Repo Type:/d;/Build:/d;/commit=/d;/Current Version/d;/Update Check/d' metadata/$PNAME.txt
sed -i "/Summary:/i Auto Name:$LABEL" metadata/$PNAME.txt
echo "Current Version:$CV" >> metadata/$PNAME.txt
echo -e "Current Version Code:$CVC\n" >> metadata/$PNAME.txt

