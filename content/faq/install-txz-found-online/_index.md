---
title: "How Do I Install a txz/tgz File I Found Online?"
linktitle: "Install txz/tgz File Found Online"
---

Generally, you can't.

While technically they are very similar, txz and tgz files are in fact tar.xz
and tar.gz files, they are not the same. It's essential to understand that what
you found might not be a Slackware package, even if it has the same extension.
Most likely, it's a source tarball, which is different from a Slackware
package.

To confuse matters more, some people create source tarballs and name them with
a txz or tgz extension, instead of the more usual tar.xz and tar.gz extensions.

The format that Salix uses for its packages comes from Slackware. A Slackware
package (txz or tgz) is created with a specific version of tar and follows a
particular directory structure. It includes files that are organized
according to your system's hierarchy, such as binaries in /usr/bin and manpages
in /usr/man. On the other hand, a source tarball usually contains only the
source code.

There are some easy ways to figure out if a file is indeed a package file and
not just a general purpose tarball. First, you can look at the filename.
Packages follow a certain naming convention, they should look something like
this:

```
salixtools-gtk-2.5.7-noarch-1gv.txz
```

This can be split in four different parts, delimited by dashes: the package
name (in this case "salixtools-gtk"), the package version ("2.5.7"), the
architecture (in this case "noarch", but it could be "x86_64" or "i686" among
others), the packaging release number (in this case "1gv"), which is
just a number that is incremented every time the same version of the software
is repackaged and finally the extension ("txz").

An additional check you can make is list the file's contents. You can do that with
something like:

```
tar tf salixtools-gtk-2.5.7-noarch-1gv.txz
```

or opening with your GUI archiver. If it is indeed a package file, there should
be an install/slack-desc file somewhere in there. In the terminal you can just
run:

```
tar tf salixtools-gtk-2.5.7-noarch-1gv.txz | grep ^install
```

and you should see something like this:

```
install/
install/slack-desc
```

If you have that, then chances are this is indeed a valid Slackware package.

But even then, you should be very cautious about installing it in your system.
As a rule of thumb, never blindly trust binaries that you download online. It
could also be the case that whoever created the package had no malicious
intentions, yet it could still break your system. This could happen by
replacing a key system library, which may have worked in the package creator's system,
but not on yours. After all, the package may have been intended for a
different Slackware (and therefore Salix) release or for a different
architecture than yours.

If what you found is indeed a package and you really want to install it, then
you can just run spkg like this example:

```
sudo spkg salixtools-gtk-2.5.7-noarch-1gv.txz
```

