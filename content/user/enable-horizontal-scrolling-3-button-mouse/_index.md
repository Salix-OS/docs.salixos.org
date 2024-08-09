---
title: "How to enable horizontal scrolling with a 3-button mouse"
menutitle: "3-button Mouse Horizontal Scrolling"
---

You may have a 3 buttons mouse with vertical scroll, but no physical horizontal scroll.

Here is how to have horizontal scroll emulation using **SHIFT + vertical scroll**.

## Installation 


First install those two packages from source:


```
sudo slapt-get -i xbindkeys xautomation
```

* __xbindkeys__ will be use to do an action of specific events (here shift + vertical scroll).
* __xautomation__ will be use to generate the horizontal scroll events for X.

## Configuration 


Vertical scrolling is seen as two __buttons__ by X, by default it's button 4 and 5. (1 is left, 2 is right, 3 is middle)
Horizontal scrolling is also seen as two __buttons', 6 and 7 by default.

So the idea is, for each **SHIFT + button 4**, a **button 6** event should be generated. The same for button 5 and 7.

Create the file **~/.xbindkeysrc.scm** with the following content:


```
; bind shift + vertical scroll to horizontal scroll events
(xbindkey '(shift "b:4") "xte 'mouseclick 6'")
(xbindkey '(shift "b:5") "xte 'mouseclick 7'")
```

Then create the file **~/.config/autostart/xbindkeys.desktop** with the following content:

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=xbindkeys
Exec=xbindkeys
```

This will run **xbindkeys** on every desktop login. You can run __xbindkeys__ directly to have it work right now.

## Firefox 

For this to work in Firefox too, you have to disable the action bound to shift+scroll which do __back and forward action__ per default.

Go to **about:config**, search the key **mousewheel.with_shift.action** and assign it the value **-1**.


