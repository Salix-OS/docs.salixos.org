---
title: "How to Install the Proprietary NVIDIA Driver"
linktitle: "Install NVIDIA Driver"
---

You need to close all running applications during the installation of the
driver. Therefore if you want to be able to view these instructions while
working through them you should open them on another computer or create a
printout.

## Prerequisites

* Download the [proprietary NVIDIA driver](https://www.nvidia.com/en-us/drivers/unix/) and save it to a known location. Throughout this guide we assume you used your home directory.
* [Install the kernel sources](/faq/kernel-source)

## Installation

* Close all your applications and save all data. Also log out if possible.
* Now press __Ctrl + Alt + F2__ to go to a terminal in text-mode and login.
* Now terminate X by dropping to runlevel 3 (text-mode only):

```
sudo init 3
```

* Now change to the folder where you saved the NVIDIA driver. If it's in your home directory, run:

```
cd ~
```

* Now start the installer:

```
sudo sh NVIDIA-Linux-*.run
```

* Follow the instructions of the installer. Select to update your xorg.conf.
Otherwise you need to do so manually.
* When finished, reboot:

```
sudo reboot
```


You can tweak some settings with the __nvidia-settings__ tools now, if you
need/want to. To be able to save any such changes to your __xorg.conf__ you
need to run the __nvidia-settings__ tool as root.

