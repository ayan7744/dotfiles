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
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# execute on startup

feh --bg-scale --no-fehbg $HOME/Pictures/Wallpapers/arch-win.jpg &
$HOME/bin/touchpad-sensitivity & 		# executes script to fix sensitivity
setxkbmap -option caps:swapescape & 	# swaps Escape and CapsLock
xset r rate 280 35 &					# sets key repeat rate = 35 /s and key repeat delay = 280ms
spotify-listener &                      # polybar spotify module dbus event listener
# clipmenud &                             # clipmenu daemon
# picom -b --config $HOME/.config/picom/picom.conf

exec i3

# i3 logging :
# exec i3 -V -d all &>> "$HOME/i3.log"
