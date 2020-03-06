---
title: "Boot into existing installation on hard disk using installation CD"
menutitle: "Boot into existing installation"
---

After installing Salix to hard disk my LILO or GRUB was broken. How can
I boot into the installed system on the hard disk using Salix
installation CD (not LiveCD)?

Put the Salix installation CD into the drive, reboot and when prompt
appears type this: 

```
hugesmp.s root=/dev/partition rdinit=    ro
```

where `partition` stands for your partition number (ie. sda2; sdb1, etc.)
where Salix was installed and yes there is a *space* between `rdinit=` and
`ro`. 