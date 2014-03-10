#!/usr/bin/env python2

# For use with F-Droid server: https://gitorious.org/f-droid/froidserver
# Copy this file (or the sample config from that repo) to my-fdroiddata/config.py, 
# then amend the settings below according to your system configuration.
# Alternatively, a config will be generated with $fdroid init.
# Run $fdroid update --pretty from my-fdroiddata/ to generate the index.

# Path to the Android SDK, $ANDROID_HOME already set on most systems
#sdk_path = "/path/to/android-sdk"
sdk_path = "$ANDROID_HOME"

# Path to the Android NDK, $ANDROID_NDK already set on most systems
# Legacy toolchains are only needed by some apps
#ndk_path = "/path/to/android-ndk"
ndk_path = "$ANDROID_NDK"

# Build tools version to be used
build_tools = "19.0.1"

# Command for running Ant
#ant = "/path/to/ant"
ant = "ant"

# Command for running maven 3
#mvn3 = "/path/to/mvn"
mvn3 = "mvn"

# Command for running Gradle
#gradle="gradle-1.9"
#gradle="gradle-1.10"
gradle="gradle-1.11"

#repo_url = "https://gitorious.org/asdgasd"
#repo_name = "Appz"
#repo_icon = "icon-fancy_repo.png"
repo_url = "http://192.168.1.9:3000"
repo_name = "Appz Local"
repo_icon = "icon_repo.png"
repo_description = """
Android apps.
"""


# Signing: read https://developer.android.com/tools/publishing/app-signing.html
# See the first and last parts of https://f-droid.org/manual for help.
# You'll need Java 1.7 (OpenJDK 7) to build an index: change it with
# sudo update-alternatives --config java.

#The key (from the keystore defined below) to be used for signing the
#repository itself. Can be None for an unsigned repository.
#repo_keyalias = None
repo_keyalias = 'repokey'

#The keystore to use for release keys when building. This needs to be
#somewhere safe and secure, and backed up!
keystore = "/home/me/.local/share/fdroidserver/keystore.jks"

#The password for the keystore (at least 6 characters).
keystorepass = "password1"

#The password for keys - the same is used for each auto-generated key
#as well as for the repository key.
keypass = "password2"

#The distinguished name used for all keys.
keydname = "CN=Birdman, OU=Cell, O=Alcatraz, L=Alcatraz, S=California, C=US"

#Use this to override the auto-generated key aliases with specific ones
#for particular applications. Normally, just leave it empty.
keyaliases = {}
keyaliases['com.example.app'] = 'example'
#You can also force an app to use the same key alias as another one, using
#the @ prefix.
keyaliases['com.example.another.plugin'] = '@com.example.another'

# The full path to the root of the repository.  It must be specified in
# rsync/ssh format for a remote host/path. This is used for syncing a locally
# generated repo to the server that is it hosted on.  It must end in the
# standard public repo name of "/fdroid", but can be in up to three levels of
# sub-directories (i.e. /var/www/packagerepos/fdroid).
serverwebroot = 'user@example:/var/www/fdroid'

# If you want to force 'fdroid server' to use a non-standard serverwebroot
#nonstandardwebroot = True

#Set this to true to always use a build server. This saves specifying the
#--server option on dedicated secure build server hosts.
build_server_always = False

