#!/bin/bash

# Launch color picker
kitty -T xcolor -e xcolor -s

if [[ "$?" == 0 ]] ; then
    notify-send "Color Picker" "Picked color to clipboard." --icon="colors" --app-name="xcolor"
fi
