#!/bin/bash

occupied_desktops() {
	occ=$(bspc query -D -d .occupied --names | rg -U '\n' -r '|')
	occ=${occ%|*}
	echo "^($occ)$"
}

pipe_update() {
	while read -r line; do occupied_desktops; done
}

occupied_desktops
bspc subscribe node_add node_remove node_transfer | pipe_update
