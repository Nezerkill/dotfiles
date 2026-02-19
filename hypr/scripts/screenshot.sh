#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
NAME="screenshot_$(date +%Y%m%d_%H%M%S).png"

option=$1

case $option in
    "full")
        grim "$DIR/$NAME"
        notify-send "Скриншот сохранен" "Файл: $NAME" -i "$DIR/$NAME"
        ;;

    "area")
        grim -g "$(slurp)" - | wl-copy
        notify-send "Скриншот" "Скопировано в буфер обмена"
        ;;

    "edit")
        grim -g "$(slurp)" - | swappy -f -
        ;;
esac
