## Originally published at https://github.com/dalb8/my-fdroiddata.
# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


#! /bin/bash

# Extract some useful info from an APK and write it to a metadata file
# Would use instead of fdroid update -c

PNAME=$(echo "$(aapt d badging "$1" |grep -m 1 'package')" | awk -F"name='|'" '{print $2}')
LABEL=$(echo "$(aapt d badging "$1" |grep -m 1 'application-label')" | awk -F"application-label='|'" '{print $2}')
CV=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionName='\(.*\)'.*/\1/")
CVC=$(echo "$(aapt d badging "$1" |grep -m 1 'version')" | sed "s/.*versionCode='\([0-9]*\)'.*/\1/")
echo "Writing to $MYFDROIDDATA/metadata/$PNAME.txt"
cp -n $MYFDROIDDATA/templates/minimal.txt $MYFDROIDDATA/metadata/$PNAME.txt
sed -e "s/^Auto Name:$/Auto Name:$LABEL/" -e '/^Repo Type:$/d' -e '/^Repo:$/,+1d' -e '/^Build:$/d' -e '/^    commit=$/,+1d' -i $MYFDROIDDATA/metadata/$PNAME.txt
sed -i "/^Current Version:/i #In Repo:$CV,$CVC" $MYFDROIDDATA/metadata/$PNAME.txt
echo "Open metadata?"
read
edit $MYFDROIDDATA/metadata/$PNAME.txt

#echo "#Current Version:$CV" >> $MYFDROIDDATA/metadata/$PNAME.txt
#echo -e "#Current Version Code:$CVC\n" >> $MYFDROIDDATA/metadata/$PNAME.txt

