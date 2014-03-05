#! /usr/bin/python
import hashlib, sys
print hashlib.md5(sys.argv[1]).hexdigest()[:8]

#jarsigner -keystore keystore.jks -storepass storepass -keypass keypass -sigalg MD5withRSA -digestalg SHA1 unsigned/com.example.app_1.apk 123ABC
#zipalign -f 4 unsigned/com.example.app_1.apk repo/com.example.app_1.apk

