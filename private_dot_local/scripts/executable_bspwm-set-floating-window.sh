#!/bin/bash

screenWidth=1920
screenHeight=1080

width=$(xdotool getactivewindow getwindowgeometry --shell | head -4 | tail -1 | sed 's/[^0-9]*//')
height=$(xdotool getactivewindow getwindowgeometry --shell | head -5 | tail -1 | sed 's/[^0-9]*//')

newPosX=$((screenWidth/2-width/2-3))
newPosY=$((screenHeight/2-height/2+21))

bspc node -t floating
xdotool getactivewindow windowsize "$width" "$height"
xdotool getactivewindow windowmove "$newPosX" "$newPosY"
