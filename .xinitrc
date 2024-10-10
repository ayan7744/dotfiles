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

feh --bg-scale --randomize --no-fehbg "$WALLPAPER_DIR" & 
# fix sensitivity and accel
touchpadctl --default &
# swap Escape and CapsLock
setxkbmap -option caps:swapescape &
# fix ugly cursor
xsetroot -cursor_name left_ptr & 
# sets key repeat rate = 35 /s and key repeat delay = 280ms
xset r rate 280 35 &
# for /etc/udev/rules.d/00-freeze-backlight.rule
restore-brightness --init &
# fix slow firefox startup
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
# fix screen blanking
xset -dpms
xset s 0

# start night light
redshift -o

# picom -b --config $XDG_CONFIG_HOME/picom/picom.conf
exec bspwm
