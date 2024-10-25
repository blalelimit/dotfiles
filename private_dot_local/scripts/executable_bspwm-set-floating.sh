#!/bin/bash

# Set desktop as floating layout
FLOATING_DESKTOP_ID=$(bspc query -D -d '^4')

# bspc subscribe node_add | while read -a msg ; do
#     node_id=${msg[4]}
#     bspc node "$node_id" -t floating
# done

bspc subscribe node_add | while read -a msg ; do
    desk_id=${msg[2]}
    wid=${msg[4]}
    [ "$FLOATING_DESKTOP_ID" = "$desk_id" ] && bspc node "$wid" -t floating
done
