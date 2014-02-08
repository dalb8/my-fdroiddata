my-fdroiddata  
==
*Recipes for building Android apps from source code*

It's the same format used to make the packages on [f-droid.org](https://f-droid.org).
They have 1000 different apps (and serve two-million APKs a month) but there 
are only 300 recipes here. 
So we can try a less industrial approach; rambling descriptions and device-specific 
patches are positively welcomed!
Write as many comments as you like!

-------
We are tolerant of, if not delighted about, obsolete data. 
The Current Versions are updated automatically and perhaps infrequently, 
so they could easily be incorrect.

Since faults would otherwise go unnoticed, new builds should only be
committed after inspecting the source code and running the APK on a gadget.
Prebuilt libraries, whether included or pulled at build time from maven repos, 
should have been built by a third party, unless otherwise stated.

By all means, include in-development apps; if they don't get very far
we'll add the 'Disabled:' field and eventually delete them.
This is also true for apps that aren't licensed properly or go proprietary.

Everything should build with a recent version of 
[fdroidserver](https://gitorious.org/f-droid/fdroidserver), but maybe not
on a build server so we need to be tolerant of dependency issues for some apps.
In particlular, the gradle versioning system for non-build server setups is
dependent on your path to the gradle binary and you might have to change the
gradle android plugin versions.

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
[this](https://f-droid.org/forums/topic/adding-apps-with-git/#post-587) post
for help in making contributions.

