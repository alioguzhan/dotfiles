#!/bin/sh

B='#252627' # blank
C='#D3D4D9' # clear ish
D='#4B88A2' # default
T='#FFF9FB' # text
W='#BB0A21' # wrong
V='#4B88A2' # verifying

i3lock \
    --insidevercolor=$C \
    --ringvercolor=$V \
    \
    --insidewrongcolor=$C \
    --ringwrongcolor=$W \
    \
    --insidecolor=$B \
    --ringcolor=$D \
    --linecolor=$B \
    --separatorcolor=$D \
    \
    --verifcolor=$T \
    --wrongcolor=$T \
    --timecolor=$T \
    --datecolor=$T \
    --layoutcolor=$T \
    --keyhlcolor=$W \
    --bshlcolor=$W \
    \
    --screen 1 \
    --blur 5 \
    --clock \
    --indicator \
    --timestr="%H:%M:%S" \
    --datestr="%A, %m %Y" \
    --keylayout 1 \
    --nofork
