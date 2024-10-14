#!/bin/bash

dir="$HOME/.config/rofi/alt-tab"
theme='style'

rofi \
    -show window \
    -selected-row 1 \
    -auto-select \
    -kb-toggle-sort "" \
    -kb-move-char-back "" \
    -kb-move-char-forward "" \
    -kb-cancel "Alt+Escape,Super_L,Super_R,Escape" \
    -kb-accept-entry "!Alt-grave,!Alt+Alt_L,Alt+Return,Return"\
    -kb-row-down "Alt+grave,Alt+Down,Down" \
    -kb-row-up "Alt+asciitilde,Alt+Up,Up" \
    -kb-row-left "Alt+Left,Left" \
    -kb-row-right "Alt+Right,Right" \
    -timeout-delay 1 -timeout-action "kb-accept-entry" \
    -theme ${dir}/${theme}.rasi
