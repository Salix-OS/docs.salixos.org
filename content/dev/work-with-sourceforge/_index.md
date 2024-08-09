---
title: "How to Work with Sourceforge"
menutitle: "Sourceforge"
---

## Upload file releases 

You have to be a project admin to upload files. Then create a shell to sourceforge:

```
ssh -t USERNAME,salix@shell.sourceforge.net create
```
This shell will stand for 4 hours.
Create the directories needed (if any) under Salix directory:

```
mkdir /home/frs/project/s/sa/salix/NEW_DIRECTORY
```
Upload the files using scp:

```
scp MY_RELEASE.iso USERNAME,salix@shell.sourceforge.net:/home/frs/project/s/sa/salix/NEW_DIRECTORY/
```

Make sure new folders are group writeable, so other project admins can
add/delete files to the new folder, too. Finally, announce the release in the
announcements forum or wherever you like ;-)
