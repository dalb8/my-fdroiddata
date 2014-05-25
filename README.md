my-fdroiddata  
==
*For making an index of a collection of APKs (and for building the latter from source)*

It's a similar format to that used to make the packages on
[f-droid.org](https://f-droid.org).  While they have over 1000 different apps
(and serve two-million APKs a month), here are found only recipes that are of
use to myself (and yourself).

So we can try a less industrial approach; rambling descriptions and
device-specific patches are positively welcomed! Write as many comments as you
like!

-------
Since faults would otherwise go unnoticed, new builds should only be committed
after inspecting the source code, doing the build and running the APK on a
gadget. If testing wasn't thorough, add a comment above the `Build:` parameter
with something like `#not exact` (as I often do when I get lazy and use the
gradle wrapper).

Pre-built libraries, whether included in `libs/` or pulled from remote maven
repos at build time, should have been built by some third party who has no
relation to the app developers, unless it says differently in the description.

By all means, include in-development apps; if they turn out to be flops
we'll add the `Disabled:` field and eventually delete them.

The bulk of these builds were done at the April 4, 7f822b01bf75 commit of
[fdroidserver](https://gitlab.com/fdroid/fdroidserver).
Depending on the distro and the app, you could have dependency issues.
Also non-buildserver fdroid only allows one version of the gradle binary: that which
is chosen in `config.py`.  There may exist many versions and the only way I
know of around this is to edit `config.py` on a build-by-build basis. See the
templates/ directory for a template.

If you're distributing APKs please try to provide updates for new versions and
to mention any significant modifications in the APK and description.  If it
looks like that could be hard, change the package name following the
custom\_rules.xml template, via the build.gradle or with the script in tools/.

Currently this git repo is about 20MiB in size.
If you're new to git or Gitorious, look at 
[this](https://f-droid.org/forums/topic/adding-apps-with-git) post
for help in making contributions.

The repo icon is taken from the Android SDK.  The files in build/extlib are
free jars, libraries and what-not, except for a few zip files which have icons
that are modifications of other free icons, and word lists for use in
dictionaries, whose licences are mentioned in the corresponding metadata files
if not inside the archive itself.

&mdash; Dave Black

