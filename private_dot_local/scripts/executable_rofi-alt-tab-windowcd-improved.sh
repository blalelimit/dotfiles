#/bin/bash

# Get number of windows in current desktop
windows=$(bspc query -N -d focused -n .window.\!hidden | wc -l)

if [[ $windows < 2 ]]; then
    exit 0
elif [[ $windows == 2 ]]; then
    bspc node -f last.local
else
    rofi-alt-tab-windowcd.sh
fi
