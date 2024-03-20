#!/bin/sh
eww daemon && eww open bar
sleep 1 # stalonetray needs eww bg (-p arg), without wait it sets loading bg (half transparent)
killall stalonetray
stalonetray -v -p --geometry 1x8+12+664 --icon-size 20 --slot-size 22 --icon-gravity S # eww doesn't have tray widget (yet)
