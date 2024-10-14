#!/bin/bash

dir="$HOME/.config/rofi/window"
theme='style'

## Run
rofi \
    -show windowcd \
    -selected-row 1 \
    -hover-select -me-select-entry '' \
    -me-accept-entry MousePrimary \
    -kb-cancel "Super_L,Super_R,Escape" \
    -theme ${dir}/${theme}.rasi
