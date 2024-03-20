#!/bin/env sh
ln -sf $HOME/.config/xsettingsd/xsettingsd-light.conf $HOME/.config/xsettingsd/xsettingsd.conf
killall -HUP xsettingsd
~/.config/bspwm/startbar.sh
