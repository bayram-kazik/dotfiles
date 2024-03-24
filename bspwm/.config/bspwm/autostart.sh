#!/bin/sh

once() {
    if ! pgrep -f $1 >/dev/null; then
        $@ &
    fi
}

once picom
once redshift -l 30:30
once dunst
once greenclip daemon
once lxpolkit
once gnome-keyring-daemon --start --foreground --components=secrets
once xsettingsd
killall -HUP xsettingsd
once darkman run

~/.config/bspwm/setupmonitors.sh
~/.config/bspwm/mouseconfig.sh
~/.config/bspwm/startbar.sh &

setxkbmap us,tr -option grp:alt_caps_toggle
xsetroot -cursor_name left_ptr
xset -b # disable beep sound
feh --bg-center /usr/share/backgrounds/gnome/morphogenesis-d.svg

once nm-applet
once volumeicon
once nextcloud
