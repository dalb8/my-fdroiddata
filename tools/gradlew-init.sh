## Originally published at https://gitorious.org/asdgasd/my-fdroiddata.
# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# Report about some features of a gradle build

#! /bin/sh

echo -e "\033[31m   Wrapper:"
echo -e "\033[0m"
grep \.zip gradle/wrapper/gradle-wrapper.properties
find -L . -name build.gradle -print |xargs grep classpath

echo -e "\n\033[31m   Overall:"
echo -e "\033[0m"
grep gradle build.gradle
grep -v '^#' gradle.properties

echo -e "\n\033[31m   Build Tools:"
echo -e "\033[0m"
echo 'Available:'
ls $ANDROID_HOME/build-tools
grep buildTools $(find -L . -name build.gradle)

echo -e "\n\033[31m   Library settings:"
echo -e "\033[0m"
cat settings.gradle

echo -e "\n\n\033[31m   Repos:"
echo -e "\033[0m"
find -L . -name build.gradle -print |xargs grep -A 2 repositor

echo -e "\n\033[31m   Branches:"
echo -e "\033[0m"
git branch -a

echo -e "\n\033[31m   My diffs:"
echo -e "\033[0m"
git --no-pager diff

echo -e "\n\n\033[31m   Prebuilts and assets:"
echo -e "\033[0m"
find -L . -name build
find -L . -name \*jar | grep -v 'gradle\|build\|dexed'
find -L . -name \*zip -o -name \*.a -o -name \*so -o -name \*apk
echo " "
ls -R $(find -L . -name assets -o -name raw -o -name AndroidManifest.xml)

echo -e "\n\n\033[31m   Scripts:"
echo -e "\033[0m"
find -L .  -maxdepth 2 -type f -executable

echo -e "\n\n\033[31m   Licence:"
echo -e "\033[0m"
ls -1 LICENSE* COPYING* | xargs head -n 3 
grep  -i 'Apache\|GNU\|Copyright\|GPL\|Lice' $(find . -iname readme*)

echo -e "\n\n\033[31m   Fix:"
echo -e "\033[0m"
sed -i 's/-all.zip/-bin.zip/g' gradle/wrapper/gradle-wrapper.properties
diff $MYFDROIDDATA/templates/gradlew gradlew
chmod +x gradlew
echo " "

