---
title: "Can I use slackpkg in Salix?"
menutitle: "slackpkg"
---

It is recommended that you use slapt-get/gslapt and not slackpkg.
slackpkg is a package manager that was designed to manage packages from
a single Slackware repository only. 

Using slackpkg in Salix could cause (at least) some Salix (customized
packages) to be replaced with their Slackware counterparts, which would
remove the Salix customizations.  Worse case scenario you could end up
removing all Salix packages resulting in a mostly unusable system.
