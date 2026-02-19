#!/bin/bash

WEATHER=$(curl -s 'wttr.in?format=1' | tr -d '\n')

if [[ $WEATHER == *"Unknown"* ]] || [[ -z $WEATHER ]]; then
    echo "Offline"
else
    echo "$WEATHER" | tr -d ' '
fi
