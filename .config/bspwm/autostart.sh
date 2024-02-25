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

/home/$USER/.screenlayout/two-monitors.sh &
feh --bg-center /usr/share/backgrounds/gnome/morphogenesis-d.svg

xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Natural Scrolling Enabled" 1
