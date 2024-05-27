#!/bin/bash
day_night='night'
[[ "$(darkman get)" == "light" ]] && day_night='day'
tmux set -g @tokyo-night-tmux_theme "$day_night"
