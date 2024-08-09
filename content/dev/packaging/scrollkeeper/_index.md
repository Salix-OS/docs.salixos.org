---
title: "Scrollkeeper and Packaging"
menutitle: "Scrollkeeper"
---

## What is scrollkeeper? 

ScrollKeeper is a cataloging system for documentation on open systems. It
manages documentation metadata and provides a simple API to allow help browsers
to find, sort, and search the document catalog.

AFAIK nothing beyond the Gnome and KDE help browsers does anything usefull with it.

## How does it work? 

Scrollkeeper reads files with meta data (provided in the packages of programs
that use this) and templates (provided by the scrollkeeper package). It
combines these into a database. This database can in turn be read by the help
browsers.

## What does this mean for package builders? 


Packages for programs that provide information through scrollkeeper should
contain *.omf files and put these in a directory under
__${DEST}/usr/share/omf__. If this directory is created, but does not contain
any files, then there probably went something wrong in the build process.

The __make install__ process for some programs generates a scrollkeeper
database under __${DEST}/var/lib/scrollkeeper__ or
__${DEST}/var/scrollkeeper__. Since the scrollkeeper database is a system wide
resource and system specific, these files should not end up in the package. So
the build scripts for programs that do this should contain some command to
remove this redundant database.

The database on the system where the package will be installed does not update
automatically when new files appear under __/usr/share/omf__. So the
__doinst.sh__ script must take care of updating the scrollkeeper database.

## Example from the gnome-desktop package 


configure should be run with the __--disable-scrollkeeper__ option

```
./configure other-configure-options --disable-scrollkeeper
```

Sometimes __--disable-scrollkeeper__ doesn't work right and files end up in
__var/scrollkeeper__ into your packaging directory anyway (__$startdir/pkg__ if
you using [[SLKBUILD]]), so in that case you'll have to remove them manually.
In the build script somewhere between (the last) __make install__ and
__makepkg__ add:


```
# redundant scrollkeeper
if [ -d $startdir/pkg/var/scrollkeeper ]; then
	rm -r $startdir/pkg/var/scrollkeeper
fi
if [ -d $startdir/pkg/var/lib/scrollkeeper ]; then
	rm -r $startdir/pkg/var/lib/scrollkeeper
fi
```

The scrollkeeper updating should happen when the package is being installed, so this has to be added in your __doinst.sh__ script:

```
# Update the scrollkeeper database (Remove stale pieces)
if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update > /dev/null 2>&1
fi
```

