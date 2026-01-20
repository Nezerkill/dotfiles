#!/bin/bash

# Папка с обоями
DIR="$HOME/.config-dev/dotfiles/assets"
# Выбираем случайную картинку
PICS=($(ls ${DIR} | grep -E ".jpg|.png|.jpeg"))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

# Меняем обои с эффектом
swww img ${DIR}/${RANDOMPICS} --transition-type random --transition-step 90 --transition-fps 60
