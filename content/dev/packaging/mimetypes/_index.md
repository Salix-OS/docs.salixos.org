---
title: "Installing Mimetypes with a Package"
menutitle: "Mimetypes"
---

When your package includes xml files in __usr/share/mime__, the system should
be informed about the new mimetypes when the package is installed. That can be
accomplished by entering the following code in your doinst.sh:

```
#update the mime desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database -q
fi
# update the mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime > /dev/null 2>&1
fi
```

