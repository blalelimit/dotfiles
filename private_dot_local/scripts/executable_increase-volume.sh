#!/bin/bash

# Increase volume +5%
pamixer -i 5 --allow-boost --set-limit 150

notify-send "Volume" "$(pamixer --get-volume-human)" --app-name="pamixer"
