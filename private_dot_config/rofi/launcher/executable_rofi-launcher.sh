#!/bin/bash

dir="$HOME/.config/rofi/launcher"
theme='style'

## Run
rofi \
    -show drun \
    -hover-select -me-select-entry '' \
    -me-accept-entry MousePrimary \
    -kb-cancel "Super_L,Super_R,Escape" \
    -kb-move-char-back "Alt+Left" \
    -kb-move-char-forward "Alt+Right" \
    -kb-row-up "Up" \
    -kb-row-down "Down" \
    -kb-row-left "Left" \
    -kb-row-right "Right" \
    -location 0 \
    -theme ${dir}/${theme}.rasi
