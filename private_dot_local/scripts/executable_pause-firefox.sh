#!/bin/bash

# Pause firefox
players=$(playerctl metadata -fa '{{playerName}}:{{status}}' | grep firefox)

if [[ $(echo "$players") != "" ]]; then
    status=$(echo "$players" | cut -d ":" -f 2)
    
    if [[ "$status" == "Paused" ]]; then
        notify-send "Status" "Playing" --icon="firefox" --app-name="firefox"
    else
        notify-send "Status" "Paused" --icon="firefox" --app-name="firefox"
    fi
fi

playerctl play-pause --player=firefox
