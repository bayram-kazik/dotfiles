#! /bin/sh

once() {
	if ! pgrep -f $1 >/dev/null; then
		$@ &
	fi
}

start_bar() {
	eww daemon && eww open bar
	killall stalonetray
	stalonetray -v -bg '#121212' --geometry 1x6+6+675 --max-geometry 1x6+6+675 --icon-size 28 --icon-gravity S
}

once picom
once redshift -l 25:25
once dunst
once greenclip daemon
once lxpolkit
once unclutter
start_bar

~/.screenlayout/two-monitors.sh
~/.local/bin/mouse_config.sh
setxkbmap us,tr
xsetroot -cursor_name left_ptr
feh --bg-center /usr/share/backgrounds/gnome/morphogenesis-d.svg
