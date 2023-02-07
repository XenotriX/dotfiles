#!/bin/sh

i3lock \
    --image ~/Pictures/lock_wallpaper.jpeg \
    --center \
\
    --clock \
    --force-clock \
    --time-pos x+80:y+h-80 \
    --time-align 1 \
    --time-color ffffffff \
    --time-size 120 \
    --time-font "Roboto Thin" \
\
    --radius 20 \
    --ring-width 5 \
    --line-color 00000000 \
    --inside-color 00000000 \
    --keyhl-color 00000000 \
    --bshl-color 00000000 \
    --ring-color ffffff80 \
    --separator-color 00000000 \
    --ind-pos x+w-80-r:y+h-80-r \
\
    --verif-pos x+w-80-r-r-r:y+h-80-r+5 \
    --verif-color ffffff88 \
    --verif-align 2 \
    --verif-text "Verifying" \
    --verif-font "Roboto" \
    --verif-size 20 \
\
    --wrong-pos x+w-80-r-r-r:y+h-80-r+5 \
    --wrong-color ffffff88 \
    --wrong-align 2 \
    --wrong-text "Wrong" \
    --wrong-font "Roboto" \
    --wrong-size 20 \
\
    --noinput-text "" \
\
    --ringver-color ffffff80 \
    --insidever-color 00000000 \
    --ringwrong-color f4433680 \
    --insidewrong-color 00000000 \
