#!/bin/bash

dir="$HOME/.config/rofi/launcher"
theme='style'

## Run
rofi \
    -show drun \
    -hover-select -me-select-entry '' \
    -me-accept-entry MousePrimary \
    -kb-cancel "Super_L,Super_R,Escape" \
    -kb-row-down "Alt+Down,Down" \
    -kb-row-up "Alt+Up,Up" \
    -kb-row-left "Alt+Left" \
    -kb-row-right "Alt+Right" \
    -location 0 \
    -theme ${dir}/${theme}.rasi
