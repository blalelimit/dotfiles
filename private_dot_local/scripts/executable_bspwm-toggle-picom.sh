#!/bin/bash

if [ ! -z $(pgrep -x picom) ]; then
    killall -q picom
    notify-send "Compositor" "The compositor is disabled" --app-name="picom"
else
    picom &
    notify-send "Compositor" "The compositor is enabled" --app-name="picom"
fi
