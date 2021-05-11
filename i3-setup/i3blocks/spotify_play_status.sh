#!/bin/bash

status=$(playerctl --player spotify status)
result=""

if [[ "$status" = "Playing" ]]; then
    result="<span>&#xf04c;</span>"
elif [[ "$status" = "Paused" ]]; then
    result="<span>&#xf04b;</span>"
else
    result="<span>&#xf04d;</span>"
    if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
        playerctl play-pause --player spotify
    fi
fi

echo "$result"

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    playerctl play-pause
fi
