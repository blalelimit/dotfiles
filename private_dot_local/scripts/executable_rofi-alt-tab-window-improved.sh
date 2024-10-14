#/bin/bash

# Get number of windows in all desktops
windows=$(bspc query -N -n .window.\!hidden | wc -l)

if [[ $windows < 2 ]]; then
    exit 0
elif [[ $windows == 2 ]]; then
    bspc node -f last
else
    rofi-alt-tab-window.sh
fi
