---
title: "How to Compile the Linux Kernel"
menutitle: "Kernel compilation"
---

It should be noted that the default kernel that ships with Salix will work in
most cases, and no recompiling is necessary. You should only recompile if:

* Your system's hardware is not supported by the default kernel
* You need (want) features only available in a newer kernel
* To get an extra fraction of a percent hardware performance
* For fun

**Before going ahead**, it may be easier (and will in many cases be sufficient
to solve the problem) to 
[install the kernel from Slackware current](/user/install-kernel-from-current),
which will always be relatively recent. In some cases, you may wish to
[rebuild the default kernel with different settings](/user/rebuild-kernel).

The procedure is actually quite simple, as long as you remember to reinstall
the bootloader before rebooting. However, it can take a long time.

## Preparation

First, download the appropriate kernel source from http://www.kernel.org

You will need the full kernel source tarball (the one with the tar.xz
extension).

Unpack source into a directory of your choosing (any directory will do,
preferably somewhere in your home directory).

Move to that directory, and do
```
make mrproper
```

This is a cleaning procedure and will set everything to default. You can work
from here, but it is highly recommended to use the working configuration (i.e.
the one you've been running on). The default kernel config is found in
`/proc/config.gz`, so copy this file:
```
zcat /proc/config.gz > .config
```

Next, you can configure your kernel. The advantage of using the working
configuration as a starting-point is you can leave nearly all the options just
as they are, but it may be that you need to turn on support for the hardware
that doesn't work with the existing kernel; or it may work with the new kernel
without changing anything at all. To build the kernel with the working
configuration unchanged, do:

```
make oldconfig
```

If you do need to change anything, there is a choice of interfaces for the
configuration. To use a graphical interface, do:

```
make gconfig
```

for the gtk-based config, or on a KDE system

```
make xconfig
```

for a qt interface. 

```
make menuconfig
```

will bring up the ncurses based menu-driven config, which will work even if
you're not running X.

The number of different options may appear bewildering, but pretty much all of
them can (indeed should) be left unchanged from the working configuration. If
in doubt, as a rule of thumb, it is probably best to leave it as is.

## Compiling

Once you have configured the kernel to your liking, save and exit. Then do:
```
make
```
to build the kernel. This will take some hours... 

## Installing

After it's done, do:

```
sudo make modules_install
```

to install all of the modules. All of the modules will be installed under
`/lib/modules/version`, where `version` corresponds to the release number of the
kernel compiled.

Next, copy the created kernel image and system map to the boot directory. 
```
sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-version
sudo cp -v System.map /boot/System.map-version
```
where `version` corresponds to the release number of the kernel compiled.

Assuming the kernel in your working system is the standard one that came with
Salix, the new one you just built will also be a 'huge' kernel that doesn't
need an initrd, so you can omit the next step.

## initrd

However, if you know you do need to create an initrd.gz file: 
```
/usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinux-version
```

will generate a mkinitrd command that you can then copy and paste. By default,
it will output to `/boot/initrd.gz`. You may want to change this when cutting and
pasting so that it will output to `/boot/initrd-version.gz`. Note that a
suggested lilo stanza is also created, but the initrd itself is only made when
you run the `mkinitrd` command itself. To do so, root privileges are required.

## Refresh LILO

As a final step, edit `/etc/lilo.conf` so that it will see the newly created
kernel, including the 'initrd' line only if you created one:

```
image = /boot/vmlinuz-version
root = /dev/sda6
initrd = /boot/initrd-version.gz
label = "New Kernel"
read-only
```

Don't forget to run:
```
sudo lilo
```

to take effect of the new configuration; or use whichever tool you prefer to
install the bootloader.

That's it. When you reboot, you should see the new kernel in the lilo menu, and everything should work. As a check, after the system reboots itself:
 uname -a

You should see that the kernel release number is indeed the version you just built.

The old kernel is still present, and your bootloader will still include an option to boot with it as a fallback. Once you are certain everything is working properly with the new one, you may wish to remove the old entry from the bootloader and (optionally, with care) delete the old kernel in /boot.

