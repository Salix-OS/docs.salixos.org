---
title: "Packages that are Different from Slackware"
menutitle: "Packages different from Slackware"
---

Here is a list of packages, present in both Salix and Slackware
repositories and the reasons Salix is using a different build:

## Salix 14.2

-   **elilo:** Minor tweaks to eliloconfig.
-   **hplip:** No QT GUI.
-   **lilo:** Salix artwork. Minor tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **sysvinit-scripts:** Tweaked for boot speedup. Colorized
    boot messages. Autostart feature for every executable file
    in /etc/rc.d/.
-   **v4-utils:** No QT GUI.
-   **wpa\_supplicant:** No QT GUI.

## Salix 14.1

-   **elilo:** Minor tweaks to eliloconfig.
-   **hplip:** No QT GUI.
-   **lilo:** Salix artwork. Minor tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **sysvinit-scripts:** Tweaked for boot speedup. Colorized
    boot messages. Autostart feature for every executable file
    in /etc/rc.d/.
-   **v4-utils:** No QT GUI.
-   **wpa\_supplicant:** No QT GUI.

## Salix 14.0

-   **gst-plugins-good:** Many more plugins, that are essential for
    gstreamer actually being of any use, are included.
-   **hplip:** No QT GUI.
-   **lilo:** Salix artwork. Minor tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **p11-kit:** Built with support for engine\_pkcs11.
-   **sqlite:** tcl support is broken in the Slackware package
    (32-bit only)
-   **sysvinit-scripts:** Tweaked for boot speedup. Colorized
    boot messages. Autostart feature for every executable file
    in /etc/rc.d/.
-   **v4-utils:** No QT GUI.
-   **wpa\_supplicant:** No QT GUI.

## Salix 13.37

-   **hplip:** No QT GUI.
-   **libvorbis:** Using the aotuv version instead, provides better
    quality encodes. Fully compatible with the official library version.
-   **lilo:** Slackware package repackaged with different artwork. Minor
    tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **shadow:** Patched the Slackware package for fixing a bug where the
    environment was not set correctly with su.
-   **sysvinit-scripts:** Tweaked for boot speedup. Colorized
    boot messages. Autostart feature for every executable file
    in /etc/rc.d/.
-   **wicd:** The Slackware package is broken.
-   **wpa\_supplicant:** No QT GUI.
-   **xfce:** Mount vfat devices with thunar using utf8 by default.

## Salix 13.1

-   **cups:** Patched for behaving with gnome-vfs.
-   **gst-plugins-good:** The Slackware package has no support for using
    audio/video with a webcam.
-   **libvorbis:** Using the aotuv version instead, provides better
    quality encodes. Fully compatible with the official library version.
-   **lilo:** Slackware package repackaged with different artwork. Minor
    tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **pkgtools:** The pkgtools package is available, but Salix is using
    spkg as default, however the original pkgtools are included even in
    the spkg-pkgtools package. Spkg is written in C and is much faster,
    see [their website](http://spkg.megous.com/)
-   **sc:** The slackware package doesn't really work (x86\_64 only)
-   **shadow:** Patched the Slackware package for fixing a bug where the
    environment was not set correctly with su.
-   **sysvinit-scripts:** Tweaked for boot speedup. Colorized
    boot messages. Autostart feature for every executable file
    in /etc/rc.d/.
-   **hplip:** No QT GUI.
-   **wavpack:** Newer version.
-   **wicd:** The Slackware package is broken.
-   **wpa\_supplicant:** No QT GUI.
-   **xf86-video-intel:** Offer both 2.11.0 and 2.9.1 versions of
    the driver. The older driver is needed for PCs with intel cards that
    fail to work with KMS with kernel 2.6.33.4.
-   **xfce:** Patched mousepad for fixing a bug with the Find text tool.

## Salix 13.0

-   **libvorbis:** Using the aotuv version instead, provides better
    quality encodes. Fully compatible with the official library version.
-   **lilo:** Slackware package repackaged with different artwork. Minor
    tweaks to liloconfig.
-   **mozilla-firefox:** Using the latest ESR version.
-   **pkgtools:** The pkgtools package is available, but Salix is using
    spkg as default, however the original pkgtools are included even in
    the spkg-pkgtools package. Spkg is written in C and is much faster,
    see [their website](http://spkg.megous.com/)
-   **shared-mime-info:** Support for xz compressed files.
-   **sysvinit-scripts:** Some code added to support splashy at bootup.
    Autostart feature for every executable file in /etc/rc.d/ added.
-   **hplip:** No QT GUI.
-   **wavpack:** Newer version.
-   **wicd:** The Slackware package is broken.
-   **wpa\_supplicant:** No QT GUI.
-   **xfce:** Newer exo that fixes several problems.
-   **xfce4-power-manager:** Newer version.



