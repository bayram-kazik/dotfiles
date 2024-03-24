#!/bin/sh
bspc monitor eDP-1 -d I II III IV V
if [ -z "$(xrandr | grep "HDMI-1-0 connected " | awk '{ print$1 }')" ]; then  # no second screen
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --off
	eww update multi_monitor_class=disable-multi-monitor
	bspc monitor HDMI-1-0 -r
else
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --mode 1280x720 --pos 1920x0 --rotate normal
	eww update multi_monitor_class=enable-multi-monitor
	bspc query -M HDMI-1-0 || bspc wm -a HDMI-1-0 1280x720+1920+0
	bspc monitor HDMI-1-0 -d VI VII VIII
fi
bspc wm -o
