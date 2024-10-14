#!/bin/bash

# set normal wallpaper
# wallpaper="$(cat ~/.config/feh/bspwm-wallpaper.txt)"

# set blurred wallpaper
wallpaper="$HOME/.config/i3lock/lockscreen.jpg"

magick "$(cat ~/.config/feh/bspwm-wallpaper.txt)" -filter Gaussian \
    -resize 10% -define filter:sigma=1 -resize 1920x1080^ \
    -gravity center -extent 1920x1080 -strip \
    "$wallpaper"

# set colors
MAIN='#89B4FAFF'
BLANK='#00000000'
CLEAR='#45475AFF'
DEFAULT='#292C33FF'
TEXT='#94E2D5FF'
WRONG='#F38BA8FF'
VERIFYING='#A6E3A1FF'

# launch i3lock
i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$CLEAR        \
--ring-color=$DEFAULT        \
--line-color=$CLEAR          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$WRONG         \
--time-color=$MAIN           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$VERIFYING     \
--bshl-color=$MAIN           \
\
--verif-font="CaskaydiaCove Nerd Font"  \
--wrong-font="CaskaydiaCove Nerd Font"  \
--time-font="CaskaydiaCove Nerd Font"   \
--date-font="CaskaydiaCove Nerd Font"   \
--layout-font="CaskaydiaCove Nerd Font" \
\
--radius=145                 \
--ring-width=10              \
--time-size=50               \
--date-size=25               \
--layout-size=20             \
--verif-size=40              \
--wrong-size=40              \
\
--time-str="%H:%M:%S"                   \
--date-str="%a %e %b"                   \
--verif-text="Verifying"                \
--wrong-text="Wrong"                    \
--noinput-text="No Input"               \
--lock-text="Locking"                   \
--lockfailed-text="Lock Failed"         \
\
--screen 1                   \
--clock                      \
--indicator                  \
--keylayout 1                \
--nofork                     \
--ignore-empty-password      \
--image="$wallpaper"
