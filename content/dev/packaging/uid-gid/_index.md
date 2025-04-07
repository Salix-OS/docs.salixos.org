---
title: "UIDs and GIDs to use with slkbuild"
linktitle: "slkbuild UIDs/GIDs"
---

## Recommended UID/GIDs 

The recommended UID/GIDs for use with SLKBUILD scripts are the same as
[the ones for slackbuilds.org](https://slackbuilds.org/uid_gid.txt) (Default Slackware UID/GIDs)
in order to avoid conflicts with packages build from SBo.

## Extra 


This previous list is maintained by the SBo team. If you build a package that
is not on that list, we can discuss about it on the
[mailing list](https://lists.sourceforge.net/lists/listinfo/salix-main).


## Warning 

Note that recommended UID/GIDs should not be created automatically when the user installs a package.

All informations have to be written in a README.Slackware file which will be in
the __/usr/doc/$pkgname-$pkgver__ directory, the user will have to add specific
UID/GIDs to his system by hands. A little note in the slack-desc can be
usefull.

