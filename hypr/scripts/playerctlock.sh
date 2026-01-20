#!/bin/bash

# Если аргументов нет - ругаемся
if [ $# -eq 0 ]; then
    echo "Usage: $0 --title | --artist | --arturl | --status"
    exit 1
fi

# Получаем статус плеера (Playing, Paused, Stopped или пусто)
PLAYER_STATUS=$(playerctl status 2>/dev/null)

# Если плеер вообще ничего не играет (Stopped или выключен) - выходим
# НО! Для hyprlock важно вернуть хоть что-то (пустоту), иначе он может напечатать ошибку
if [ -z "$PLAYER_STATUS" ] || [ "$PLAYER_STATUS" = "Stopped" ]; then
    echo ""
    exit 0
fi

# Обработка аргументов
case "$1" in
    --title)
        title=$(playerctl metadata --format "{{ title }}" 2>/dev/null)
        if [ -n "$title" ]; then
            echo "${title:0:50}"
        else
            echo "No Title"
        fi
        ;;
        
    --artist)
        artist=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
        if [ -n "$artist" ]; then
            echo "$artist"
        else
            echo "Unknown Artist"
        fi
        ;;
        
    --arturl)
        ART_DIR="/tmp/hyprlock_art"
        mkdir -p "$ART_DIR"
        url=$(playerctl metadata --format "{{ mpris:artUrl }}" 2>/dev/null)
        
        # Убираем file:// если есть
        if [[ "$url" == file://* ]]; then
            url=${url#file://}
        fi
        
        if [ -n "$url" ]; then
            if [[ "$url" == http* ]]; then
                filename=$(echo "$url" | md5sum | cut -d' ' -f1).png
                if [ ! -f "$ART_DIR/$filename" ]; then
                    curl -s -o "$ART_DIR/$filename" "$url"
                fi
                echo "$ART_DIR/$filename"
            else
                echo "$url"
            fi
        else
            echo ""
        fi
        ;;

    --status)
        # Если играет - показываем ПАУЗУ (две палочки), иначе - ПЛЕЙ (треугольник)
        if [[ "$PLAYER_STATUS" == "Playing" ]]; then
            echo ""
        else
            echo ""
        fi
        ;;
        
    *)
        echo "Invalid option"
        ;;
esac
