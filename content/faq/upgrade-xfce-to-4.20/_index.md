---
title: "How Do I Upgrade to Xfce 4.20?"
linktitle: "Upgrade to Xfce 4.20"
---

Salix 15.0 comes with Xfce 4.16 by default. Xfce 4.20 was released a few days
before Christmas 2024 and a new dedicated repository for it was added shortly after.

So, if you want to upgrade your Xfce to version 4.20, all you have to do is add
that repository to your slapt-get package manager configuration in the
/etc/slapt-get/slapt-getrc file.

For 64-bit systems, you can add this line:

```
SOURCE=https://download.salixos.org/x86_64/xfce4.20-15.0/:PREFERRED
```

while for 32-bit systems, you can add this line:

```
SOURCE=https://download.salixos.org/i486/xfce4.20-15.0/:PREFERRED
```

and then just upgrade your system:

```
sudo slapt-get --update
sudo slapt-get --upgrade
```

You'll probably want to log out of Xfce and back in after that. You will then
be greeted with the shiny new Xfce 4.20 environment!

**NOTE**: If you have already added
[Xfce 4.18](/faq/upgrade-xfce-to-4.18/) to your system, don't forget to remove
the respective lines for it from your package manager configuration.
