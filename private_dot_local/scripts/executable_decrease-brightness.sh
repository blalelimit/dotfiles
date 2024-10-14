#!/bin/bash

# Decrease brightness -5%
brightnessctl set 5%- -n 5%

brightness="$(brightnessctl i | grep Current | awk '{print $4}' | tr -d '(' | tr -d ')')"

notify-send "Brightness" "$brightness" --app-name="brightnessctl"
