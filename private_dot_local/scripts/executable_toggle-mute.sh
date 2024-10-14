#!/bin/bash

# Toggle mute volume
pamixer -t

notify-send "Volume" "$(pamixer --get-volume-human)" --app-name="pamixer"
