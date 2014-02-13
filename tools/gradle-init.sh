# Warn about some features of a gradle build
#! /bin/sh
echo -e "\033[31m   Wrapper:"
echo -e "\033[0m"
grep \.zip gradle/wrapper/gradle-wrapper.properties

echo -e "\n\033[31m   Overall:"
echo -e "\033[0m"
grep gradle build.gradle

echo -e "\n\033[31m   Library settings:"
echo -e "\033[0m"
cat settings.gradle

echo -e "\n\n\033[31m   Repos:"
echo -e "\033[0m"
find . -name build.gradle -print |xargs grep -A 2 repositor

echo -e "\n\n\033[31m   Prebuilts and scripts:"
echo -e "\033[0m"
find . -name \*jar | grep -v 'gradle\|build\|dexed'
find . -name \*zip
find . -name \*.a
find . -name \*so
find .  -maxdepth 2 -type f -executable

echo -e "\n\n\033[31m   Licence:"
echo -e "\033[0m"
ls -1 LICENSE* COPYING | xargs head -n 3 
#grep -r 'Apache\|GNU\|Copyright' *

echo -e "\n\n\033[31m   Fix:"
echo -e "\033[0m"
sed -i 's/-all.zip/-bin.zip/g' gradle/wrapper/gradle-wrapper.properties
diff ~/fdroiddata/misc/gradlew gradlew
chmod +x gradlew
echo " "
