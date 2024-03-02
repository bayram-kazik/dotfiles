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
once unclutter
once xsettingsd
killall -HUP xsettingsd
once darkman run
~/.config/bspwm/startbar.sh &

~/.screenlayout/one-monitor.sh
~/.local/bin/mouse_config.sh
setxkbmap us,tr
xsetroot -cursor_name left_ptr
xset -b # disable beep sound
feh --bg-center /usr/share/backgrounds/gnome/morphogenesis-d.svg
