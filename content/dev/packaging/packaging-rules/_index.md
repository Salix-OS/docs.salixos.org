---
title: "Packaging rules"
linktitle: "Packaging rules"
---

Packagers are encouraged to also visit the following links:
* [Building packages with slkbuild](/dev/packaging/packaging-with-slkbuild)
* [Writing A SlackBuild Script](https://www.slackwiki.com/Writing_A_SlackBuild_Script)
* [Submitting packages for inclusion in the Salix repository](/dev/packaging/submitting-packages)
* [Recommended UIDs and GIDs](/dev/packaging/uid-gid)

## Package rules 

The package should be named `$name-$version-$arch-$packagereleaseXY.txz` with a breakdown as below:

* `$name`: the name of the software and should contain only alphanumeric characters. "-" is supported.
* `$version`: the version of the software, ie 1.5.0.6
* `$arch`: **i586** in most cases for 32-bit packages, **x86_64** for 64-bit packages, **noarch** for scripts or "resource only" packages (ie : artwork)
* `$packagerelease`: Start with 1 and for any subsequent updates to the same version of the package, increase by 1; this includes rebuilding for a new Salix edition. If the package can be transferred without rebuilding, the name remains unchanged. When upgrading to a new version, go back to 1. 
* `XY`: your initials, so it's obvious who the packager is.

The $version has the following additional restrictions:

* Separators "-" , "()" are forbidden, "." is the digit separator that should be normally used
* Packages compiled from svn sources must be version like "r12345", where 12345 is the svn commit.

All packages shall install without requiring that the user perform
postinstallation procedure to render the application usable. Not applicable to
server packages of course where configuration should always be done after
installation.

All packages must contain a valid slack-desc file containing a brief yet
accurate description of the package's contents or application. The slack-desc
file must NOT contain the name of the packager NOR the version of the packaged
software (these go to the buildscript).

The post install script doinst.sh should include only relative paths to **/** ,
ie: **/etc/profile** is addressed as **etc/profile** in the doinst.sh
script.

All packages "packagename.txz" shall be accompanied by a file named
"packagename.md5" that contains the package's md5 sum, ie:
e16-1.0.1-x86_64-1gv.txz will be shipped with e16-1.0.1-x86_64-1gv.md5

If a package "packagename.txz" has any external dependencies then the txz file
should be accompanied by a file named "packagename.dep" that includes a comma
separated list of dependencies. You can use [[depfinder]] to create that file.

All packages compiled for the x86 architecture should be compiled with
```
CFLAGS="-O2 -march=i586 -mtune=i686"
```
and/or
```
CXXFLAGS="-O2 -march=i586 -mtune=i686"
```
unless a "reasonable" condition exists to do otherwise.

All packages compiled for the x86_64 architecture should be compiled with
```
CFLAGS="-O2 -fPIC"
```
and/or
```
CXXFLAGS="-O2 -fPIC"
```
unless a "reasonable" condition exists to do otherwise.

Packages should be compiled with the following options:

```
configure --prefix=/usr --libdir=/usr/lib${LIBDIRSUFFIX} --localstatedir=/var --sysconfdir=/etc --mandir=/usr/man
```

where `$LIBDIRSUFFIX` should be empty for x86 packages and set to "64" for x86_64 packages.
This also means that: 
* Packages are not allowed to install files in "**/opt**" and "**/usr/local**" by any means.
* "**/usr**" is the install path prefix
* log files must be installed in the directory "**/var**"
* configuration files must be installed in the directory "**/etc**"
* man pages must be placed in "**/usr/man**"

All binaries and system libraries must be stripped of debugging symbols.

Man pages and Info files must be gziped.

Files installed to the directory "**/usr/doc**" must not have group/world writeable
permissions.

All X application packages which are supposed to appear in the application menu
shall install appropriate "**packagename.desktop**" files in the
"**/usr/share/applications**" directory.

All icons are to be installed in the
**/usr/share/icons/hicolor/scalable/apps/** or
**/usr/share/icons/hicolor/SIZExSIZE/apps/**
directories depending on the icon type svg or png, where SIZE is the icon size
(48x48, 32x32 etc). **/usr/share/pixmaps** use for menu icons is discouraged
but allowed if the app doesn't function properly otherwise. Internal
application images should be placed in **/usr/share/app-name/some-directory**
or **/usr/share/pixmaps/app-name** (most apps do it this way, btw).

Window Managers and Desktop Environments packages must install a .desktop file
in **/etc/share/xsessions** (ie: **/etc/X11/dm/Sessions/e16.desktop**). A
xinitrc file should be placed in the **/etc/X11/xinit** directory (ie:
**/etc/X11/xinit/xinit.e16**)

