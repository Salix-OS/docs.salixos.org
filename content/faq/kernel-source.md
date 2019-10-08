---
title: "How to install the kernel source"
menutitle: "Install kernel-source"
---

The **kernel-source** package is by default locked in *gslapt*, just
like all other kernel related packages. This is to prevent users from
unknowingly upgrading the kernel; it's easy to miss that kernel packages
are about to be upgraded, when a multitude of other packages are going
to be upgraded at the same time.

### Salix 14.1 and newer

To install the **kernel-source** package, in Salix 14.1 use `sudo` . Open
a terminal window, run
```none
sudo slapt-get -u
```

and request to install the **kernel-source** package explicitly with
`slapt-get`:
```none
sudo slapt-get -i kernel-source
```

That's it, the **kernel-source** package should be downloaded and
installed when the download is finished.


### Salix 14.0 and earlier

In order to install the **kernel-source** package, open a terminal
window, run
```
su
```

and provide your root password to become root. Update your package
database (just to be sure):
```none
slapt-get -u
```

and request to install the **kernel-source** package explicitly with
`slapt-get`:
```none
slapt-get -i kernel-source
```

That's it, the **kernel-source** package should be downloaded and
installed when the download is finished.

