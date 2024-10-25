#!/bin/bash

dir="$HOME/.config/rofi/alt-tab"
theme='style'

rofi \
    -show windowcd \
    -selected-row 1 \
    -auto-select \
    -kb-move-char-back "" \
    -kb-move-char-forward "" \
    -kb-cancel "Alt+Escape,Super_L,Super_R,Escape" \
    -kb-accept-entry "!Alt-Tab,!Alt+Alt_L,Alt+Return"\
    -kb-row-down "Alt+Tab,Alt+Down,Down" \
    -kb-row-up "Alt+ISO_Left_Tab,Alt+Up,Up" \
    -kb-row-left "Alt+Left,Left" \
    -kb-row-right "Alt+Right,Right" \
    -timeout-delay 3 -timeout-action "kb-accept-entry" \
    -theme ${dir}/${theme}.rasi
