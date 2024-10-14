#!/bin/bash

# Set tiling layout
layout=$(bspc wm -g | awk -F ':' '{print $8}')

if [[ $layout == "LT" ]] ; then
    layout="Monocle"
elif [[ $layout == "LM" ]] ; then
    layout="Tiling"
fi

bspc desktop -l next && notify-send "Layout" "$layout" --app-name="bspwm"
