#!/bin/bash

DIR="$HOME/.config-dev/dotfiles/assets"
PICS=($(ls ${DIR} | grep -E ".jpg|.png|.jpeg"))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

swww img ${DIR}/${RANDOMPICS} --transition-type random --transition-step 90 --transition-fps 60
