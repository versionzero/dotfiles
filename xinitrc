#!/bin/sh
# $Id: xinitrc,v 1.2 2003/02/27 19:03:30 jharper Exp $

## Set file locations
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

## Merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

## Setup True Type Fonts under XDarwin
xset fp+ /usr/X11R6/lib/X11/fonts/TTF

## Start the window manager
exec quartz-wm

##
# EOF
##
