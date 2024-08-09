---
title: "How to Install the Virtualbox Guest Additions in a Salix Guest"
menutitle: "Install VirtualBox Guest Additions"
---

If you're running Salix inside a virtualbox VM, you'll find out that the
virtualbox guest additions fail to install, with some kernel header error being
thrown. In order to be able to install the virtualbox guest additions, you just
need to [install the kernel-source package](/faq/kernel-source/). Reboot and the
virtualbox guest additions will install with no errors after that.
