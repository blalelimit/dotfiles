#!/bin/bash

BAR_HEIGHT=54  # polybar height
BORDER_SIZE=1  # border size from your wm settings
YAD_WIDTH=424
YAD_HEIGHT=463

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

selected_color=$(yad --color --posx="$pos_x" --posy="54" --buttons-layout=center --title="yad-color")

case $? in
    0)
        echo $selected_color | tr -d "\n" | xsel -ib
        notify-send "Color Selection" "Selected color to clipboard." --icon="colors" --app-name="yad"
    ;;
esac
