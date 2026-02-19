#!/bin/bash

# Функция включения игрового режима
enable_mode() {
    # Отключаем анимации, размытие, тени
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    # Меняем цвет рамки на красный (индикатор режима)
    hyprctl keyword general:col.active_border "rgba(db2b39ff)"
    
    # Отключаем уведомления (режим "Не беспокоить" для mako)
    makoctl mode -s do-not-disturb
    
    notify-send "GAMEMODE" "Активирован: Эффекты отключены" -u critical
}

# Функция выключения
disable_mode() {
    # Самый надежный способ вернуть всё как было — перезагрузить конфиг
    hyprctl reload
    
    # Возвращаем уведомления
    makoctl mode -r do-not-disturb
    
    notify-send "GAMEMODE" "Деактивирован: Эффекты включены"
}

# Логика переключателя
if [ "$1" == "start" ]; then
    enable_mode
elif [ "$1" == "end" ]; then
    disable_mode
else
    # Если запущен без аргументов - работает как переключатель (Toggle)
    # Проверяем текущее состояние анимаций
    STATE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
    if [ "$STATE" = 1 ]; then
        enable_mode
    else
        disable_mode
    fi
fi
