#!/bin/bash

# Decrease volume
pamixer -d 5 --allow-boost

notify-send "Volume" "$(pamixer --get-volume-human)" --app-name="pamixer"
