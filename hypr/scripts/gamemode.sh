#!/bin/bash

enable_mode() {
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"

    hyprctl keyword general:col.active_border "rgba(db2b39ff)"
    makoctl mode -s do-not-disturb

    notify-send "GAMEMODE" "Активирован: Эффекты отключены" -u critical
}

disable_mode() {
    hyprctl reload
    makoctl mode -r do-not-disturb

    notify-send "GAMEMODE" "Деактивирован: Эффекты включены"
}

if [ "$1" == "start" ]; then
    enable_mode
elif [ "$1" == "end" ]; then
    disable_mode
else
    STATE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
    if [ "$STATE" = 1 ]; then
        enable_mode
    else
        disable_mode
    fi
fi
