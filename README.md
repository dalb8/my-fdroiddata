my-fdroiddata  
==
*Recipes for building Android apps from source code*

It's the same format used to make the packages on [f-droid.org](https://f-droid.org).
While they have over 1000 different apps (and serve two-million APKs a month), here are
found only recipes that are of use to myself (and yourself).

So we can try a less industrial approach; rambling descriptions and device-specific 
patches are positively welcomed! Write as many comments as you like!

-------
We are tolerant of, if not delighted about, obsolete data. 
Current Versions are updated infrequently and/or automatically, so they could easily be 
incorrect.

Since faults would otherwise go unnoticed, new builds should only be
committed after inspecting the source code, doing the build and running the APK on 
a gadget. If testing isn't thorough, add it with the `Build:` parameter `disable=`, 
as I often do when I get lazy and use the gradle wrapper (`gradlew`).
That parameter can also be used if the licence isn't confirmed, but make sure
that the apk in `repo/` is renamed, otherwise it will get purged.

Pre-built libraries, whether included in `libs/` or pulled from remote maven repos 
at build time, should have been built by some third party (e.g. the library developers), 
unless it says differently in the description.

By all means, include in-development apps; if they turn out to be flops
we'll add the `Disabled:` field and eventually delete them.

I'm currently using a recent version of 
[fdroidserver](https://gitorious.org/f-droid/fdroidserver).
Therefore newer recipes are likely to work but older recipes might not be
valid any more. However we only keep a couple of builds per package so
we'll get around to revising them eventually.
Depending on the distro, there could also be dependency issues for some apps.
Also the gradle versioning system for non-build server setups is
dependent on your path to the gradle binary; since I'd often use the gradle wrapper,
which caches gradle versions in `~/.gradle/wrapper`, I store the path to each version 
in config.py and comment out all but one, depending on the build; I also make
symlinks like `~/bin/gradle-1.11` for when I'm not using fdroid.

Many of the texts are by the contributors to 
[fdroiddata](https://gitorious.org/f-droid/fdroiddata) and those are under the AGPLv3. 
Other texts can be covered by any free licence and you are encouraged 
to add your own copyright headers.

If you're distributing APKs try to have a recent version and to
mention any significant modifications in the APK and description. If that's
not possible, you should change the package name following the custom\_rules.xml 
template, via the build.gradle or with the script in tools/.

Currently this git repo is about 18MiB in size.
If you're new to git or Gitorious, look at 
[this](https://f-droid.org/forums/topic/adding-apps-with-git) post
for help in making contributions.

&mdash; Dave Black
