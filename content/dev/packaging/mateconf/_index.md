---
title: "MATEConf Schemas and Packaging"
menutitle: "MATEConf"
---

## What is mateconf? 

MATEConf is a configuration scheme currently used by the MATE desktop. Programs
which use it setup default values in a $NAME.schemas file which is installed
under __/etc/mateconf/schemas/$NAME.schemas__. These defaults are then
registered with the mateconf daemon which monitors the configuration values and
alerts applications when values the applications are interested in change. The
schema files also provide documentation about what each value in the
configuration system means (which gets displayed when you browse the database
in the mateconf-editor program).

For packaging purposes, we have to disable schema installation during build, or
these will get installed in the packager's system instead of put in the package
itself. They can then be created and placed in the package manually.

## Disabling schemas installation 


When a package requires the installation of mateconf schemas, there is usually
a "__--disable-schemas-install__" configure option that can be used to not let
the makefile install any schemas to the system. You can check if the configure
script provides such an option with "__configure --help__".

Sometimes the configure script accepts a "__--with-mateconf-source__" option.
This should be used together with "__--disable-schemas-install__" like this, in
order to set where and how the app should store its settings in mateconf:

```
./configure other_configure_options --disable-schemas-install --with-mateconf-source="xml::/etc/mateconf/mateconf.xml.defaults"
```

However, the "__--disable-schemas-install__" option might not be working
properly, or it might not even be available. In that case a
MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL variable must be declared when running
make install, like this:

```
MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 make install DESTDIR=$startdir/pkg
```

where $startdir/pkg is your packaging directory (as used by [[SLKBUILD]]).

Be careful not to do:


```
export MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1
```

at any point in your buildscript as pointed in some other sites about using
mateconf in other distributions, because the setting will stick and you won't
be allowed to install the schemas manually later on in your buildscript.

## Installing schemas in the package 

Files with the __.schemas__ extension will be created under the
__$startdir/pkg__ directory after running "__make install__" as specified
above. Now, we need to manually register those schemas within the packaging
directory. This can be achieved by putting something like this in your
buildscript somewhere after the "__make install__" line:

```
# mateconf stuff
export MATECONF_CONFIG_SOURCE="xml::$startdir/pkg/etc/mateconf/mateconf.xml.defaults"
if [ -d $startdir/pkg/etc/mateconf/schemas ]; then
 install -v -d -m755 $startdir/pkg/etc/mateconf/mateconf.xml.defaults
 SCHEMAS=$startdir/pkg/etc/mateconf/schemas
 for schema in $SCHEMAS/*.schemas; do
  mateconftool-2 --makefile-install-rule $schema
 done
 # Reset / Verify correct permissions
 ( cd $startdir/pkg/etc/mateconf ; find . -type d -exec chmod 755 {} \; )
 ( cd $startdir/pkg/etc/mateconf ; find . -type f -exec chmod 644 {} \; )
fi
```

where, as before, __$startdir/pkg__ is your packaging directory. This will
register any .schemas files present in $startdir/pkg/etc/mateconf/schemas and
put their default settings inside the package.

## SLKBUILD and mateconf schemas files 


If you are using SLKBUILD to create your packages, the default behaviour is
to make every file under /etc a __.new__ file automatically. A __.new__ file
does not replace any older versions of the same file, this happens only after
the user explicitly allows it to overwrite the older (already installed by a
previous version of the package) file. While this is the recommended setting
for most settings files that are placed in /etc, this is not the case for
mateconf settings files. Gconf settings files, just provide reasonable defaults
for applications, which are tweaked, in an automated way, inside the users home
directory. New mateconf settings files should always replace previously
installed files, because in many cases, they include changes that are necessary
for the newer version of the software to work properly.

So, when you are installing mateconf schemas in your package, make sure you add
the __noautodotnew__ option in your SLKBUILD:

```
options=('noautodotnew')
```

and add any other files that you want to be .new'd in the dotnew=() array (see
__man SLKBUILD__ for details)
