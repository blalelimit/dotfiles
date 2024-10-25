#!/bin/bash

BAR_HEIGHT=54  # polybar height
BORDER_SIZE=1  # border size from your wm settings
YAD_WIDTH=221  # 221 is minimum possible value
YAD_HEIGHT=101 # 101 is minimum possible value

if [ "$(xdotool getwindowfocus getwindowname)" = "yad-volume" ]; then
    exit 0
fi

eval "$(xdotool getmouselocation --shell)"
eval "$(xdotool getdisplaygeometry --shell)"

# X
if [ "$((X + YAD_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
    : $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE))
elif [ "$((X - YAD_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
    : $((pos_x = BORDER_SIZE))
else #Center
    : $((pos_x = X - YAD_WIDTH / 2))
fi

# Y
# if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
#     : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
# else #Top
#     : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
# fi

current_volume=$(pamixer --get-volume-human)

yad --scale --min-value=0 --max-value=150 \
    --value="$current_volume" --step=5 --enforce-step \
    --undecorated --fixed --print-partial \
    --button=OK --buttons-layout=center --escape-ok \
    --width="$YAD_WIDTH" --height="$YAD_HEIGHT" \
    --posx="$pos_x" --posy=54 --borders=0 \
    --title="yad-volume" | while read selected_volume
        do pamixer --set-volume "$selected_volume" --allow-boost
        done

# if [ $selected_volume = "0" ]; then
#     pamixer -m
#     notify-send "Volume" "$(pamixer --get-volume-human)" --app-name="pamixer"
#     exit 0
# fi
#
# if [ $(pamixer --get-volume-human) = "muted" ]; then
#     pamixer -u
# fi

# if [ $current_volume = "$selected_volume%" ]; then
#     exit 0
# fi
#
case $? in
    0)
        # pamixer --set-volume "$selected_volume" --allow-boost
        # notify-send "Volume" "$(pamixer --get-volume-human)" --app-name="pamixer"
        play -q ~/.config/bspwm/sounds/audio-volume-change.oga
    ;;
esac
