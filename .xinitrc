#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && source "$f"
 done
 unset f
fi

# execute on startup

feh --bg-scale --no-fehbg $WALLPAPER &
touchpadctl --default & 		            # fix sensitivity and accel
setxkbmap -option caps:swapescape & 	# swap Escape and CapsLock
xsetroot -cursor_name left_ptr &        # fix ugly cursor
xset r rate 280 35 &					# sets key repeat rate = 35 /s and key repeat delay = 280ms
# clipmenud &                             # clipmenu daemon
# picom -b --config $HOME/.config/picom/picom.conf
exec bspwm
