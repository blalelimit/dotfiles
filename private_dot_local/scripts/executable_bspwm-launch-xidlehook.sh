#!/bin/bash

# Terminate already running xidlehook instances
killall -q xidlehook

# Get primary display
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
    --detect-sleep \
    --not-when-audio \
    --timer 600 \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness 0.5' \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
    --timer 300 \
        'xset dpms force off; xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
        '' \
    --timer 300 \
        'lock-session.sh' \
        '' \
    --timer 600 \
        'systemctl suspend' \
        '' &
