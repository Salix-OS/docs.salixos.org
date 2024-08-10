---
title: "Add Flubox to Login Screen Menu"
linktitle: "Add Flubox to Login Screen"
---

Fluxbox is a Slackware package and has no provision for a login screen
menu entry, like the ones provided by GDM or LightDM. You can add an
entrty yourself by creating a `/usr/share/xsessions/fluxbox.desktop`
file with the following contents: 

```
[Desktop Entry]
Encoding=UTF-8
Type=XSession
Name=Fluxbox
Exec=dbus-launch /etc/X11/xinit/xinitrc.fluxbox
Icon=fluxbox
```

Next time you will get to the GDM screen, Fluxbox will be available as
an option. 
