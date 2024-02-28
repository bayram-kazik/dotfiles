#!/bin/bash

focused_desktop() {
	bspc query -D -d focused --names
}

pipe_update() {
	while read -r line; do focused_desktop; done
}

focused_desktop
bspc subscribe desktop_focus | pipe_update
