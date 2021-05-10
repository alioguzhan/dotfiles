#!/bin/bash

IP=$(hostname -I | awk '{ print $1 }')

if [[ "${IP}" != "" ]]; then
 echo "${IP}";
 echo ""
fi

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    hostname -I | awk '{ printf $1 }' | xsel
    notify-send "${IP} Copied to clipboard"
fi