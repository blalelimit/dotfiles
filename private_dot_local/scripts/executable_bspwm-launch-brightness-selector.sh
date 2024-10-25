#!/bin/bash

BAR_HEIGHT=54  # polybar height
BORDER_SIZE=1  # border size from your wm settings
YAD_WIDTH=221  # 221 is minimum possible value
YAD_HEIGHT=101 # 101 is minimum possible value

if [ "$(xdotool getwindowfocus getwindowname)" = "yad-brightness" ]; then
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

current_brightness=$(brightnessctl i | grep 'Current brightness' | awk '{print $4}' | tr -d '(' | tr -d ')')

yad --scale --min-value=0 --max-value=100 \
    --value="$current_brightness" --step=5 --enforce-step \
    --undecorated --fixed --print-partial \
    --button=OK --buttons-layout=center --escape-ok \
    --width="$YAD_WIDTH" --height="$YAD_HEIGHT" \
    --posx="$pos_x" --posy=54 --borders=0 \
    --title="yad-brightness" | while read selected_brightness
        do brightnessctl s "$selected_brightness\%" -n 5%
        done

# if [ $current_brightness = "$selected_brightness%" ]; then
#     exit 0
# fi
#
# case $? in
#     0)
#         brightnessctl s "$selected_brightness\%" -n 5%
#         # notify-send "Brightness" "$selected_brightness\%" --app-name="brightnessctl"
#     ;;
# esac
