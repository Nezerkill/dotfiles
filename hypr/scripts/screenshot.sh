#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
NAME="screenshot_$(date +%Y%m%d_%H%M%S).png"

option=$1

case $option in
    # 1. Весь экран -> Сохранить в файл
    "full")
        grim "$DIR/$NAME"
        notify-send "Скриншот сохранен" "Файл: $NAME" -i "$DIR/$NAME"
        ;;
        
    # 2. Выделить область -> Скопировать в буфер (Как в Windows Win+Shift+S)
    "area")
        grim -g "$(slurp)" - | wl-copy
        notify-send "Скриншот" "Скопировано в буфер обмена"
        ;;
        
    # 3. Выделить область -> Открыть в редакторе (Swappy)
    "edit")
        grim -g "$(slurp)" - | swappy -f -
        ;;
esac
