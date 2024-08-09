---
title: "Restore Fluxbox Menu"
menutitle: "Restore Fluxbox menu"
---

If for some reason you messed up your menu in your Fluxbox installation,
you can quickly restore it with:

```
cp /etc/skel/.fluxbox/menu ~/.fluxbox/
```

Alternatively, if you want to restore all default Fluxbox configuration
you can run:
```
cp -R /etc/skel/.fluxbox ~/
```
