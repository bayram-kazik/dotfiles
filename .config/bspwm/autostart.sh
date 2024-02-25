#! /bin/sh

once() {
	if ! pgrep -f $1 >/dev/null; then
		$@ &
	fi
}

once picom
once redshift -l 25:25
once dunst
once greenclip daemon

~/.screenlayout/two-monitors.sh
~/.local/bin/mouse_config.sh
setxkbmap us,tr
feh --bg-center /usr/share/backgrounds/gnome/morphogenesis-d.svg
