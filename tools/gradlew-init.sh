# Copyright (c) 2014 David Black. Licensed as CCBYSA
# See https://gitorious.org/asdgasd/my-fdroiddata

# Report about some features of a gradle build

#! /bin/sh

echo -e "\033[31m   Wrapper:"
echo -e "\033[0m"
grep \.zip gradle/wrapper/gradle-wrapper.properties
find -L . -name build.gradle -print |xargs grep classpath

echo -e "\n\033[31m   Overall:"
echo -e "\033[0m"
grep gradle build.gradle

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
find -L . -name \*jar | grep -v 'gradle\|build\|dexed'
find -L . -name \*zip -o -name \*.a -o -name \*so -o -name \*apk
echo " "
ls -R $(find -L . -name assets -o -name raw)

echo -e "\n\n\033[31m   Scripts:"
echo -e "\033[0m"
find -L .  -maxdepth 2 -type f -executable

echo -e "\n\n\033[31m   Licence:"
echo -e "\033[0m"
ls -1 LICENSE* COPYING* | xargs head -n 3 
#grep -r 'Apache\|GNU\|Copyright' *

echo -e "\n\n\033[31m   Fix:"
echo -e "\033[0m"
sed -i 's/-all.zip/-bin.zip/g' gradle/wrapper/gradle-wrapper.properties
diff ~/fdroiddata/templates/gradlew gradlew
chmod +x gradlew
echo " "

