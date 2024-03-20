#!/bin/sh
if [ -z "$(xrandr | grep "HDMI-1-0 connected " | awk '{ print$1 }')" ]; then  # no second screen
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --off
else
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --mode 1280x720 --pos 1920x0 --rotate normal
fi
