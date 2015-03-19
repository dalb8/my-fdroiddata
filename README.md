my-fdroiddata  
==
*For making an index of a collection of APKs (and for building the latter from source)*

It's a similar format to that used to make the packages on
[f-droid.org](https://f-droid.org).  While they have over 1000 different apps
(and serve millions of APKs a month), here are just found recipes that are of
use to me and my friends.

So we have a less industrial approach; rambling descriptions and
device-specific patches are positively welcomed!

-------
Since faults would otherwise go unnoticed, new builds should only be committed
after inspecting the source code, doing the build and running the APK on a
gadget. If testing wasn't thorough, or there was difficulty building the app with
fdroidserver, add a comment above the `Build:` parameter with something like 
`# not exact`.

Pre-built libraries, whether included in `libs/` or pulled from remote maven
repos at build time, should have been built by some third party who has no
relation to the app developers, unless it says differently in the description.

Depending on the distro and the app, you could have dependency issues.
Also non-buildserver [fdroidserver](https://gitlab.com/fdroid/fdroidserver) 
only allows one version of the gradle binary: that which
is chosen in `config.py`.  There may exist many versions and the only way I
know of to get around this is to edit `config.py` on a build-by-build basis. 

If you're distributing APKs please try to provide updates for new versions and
to mention any significant modifications in the APK and description.  If it
looks like that could be hard, change the package name following the
custom\_rules.xml template, via the build.gradle or with the script in tools/.

The repo icon is taken from the Android SDK.  The files in build/extlib are
free jars, libraries and what-not, except for a few zip files which have icons
that are modifications of other free icons, and word lists for use in
dictionaries, whose licences are mentioned in the corresponding metadata files
if not inside the archive itself.

If `Update Check Mode:` is preceded by a `#` then it just means that
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) 
has the file too and uses the same mode so I can track their current version
instead of checking it myself.

The aim is to keep builds that work on Android 2.3. Most of the builds here are 
only done for armeabi-v7a though the APP\_ABI flag can be removed in order to 
build for all architectures.

