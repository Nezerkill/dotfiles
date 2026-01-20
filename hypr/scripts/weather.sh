#!/bin/bash

# Получаем погоду
WEATHER=$(curl -s 'wttr.in?format=1' | tr -d '\n')

# Проверка
if [[ $WEATHER == *"Unknown"* ]] || [[ -z $WEATHER ]]; then
    echo "Offline"
else
    # tr -d ' ' удаляет ВСЕ пробелы из строки
    # Было: "⛅ +3°C" -> Стало: "⛅+3°C"
    echo "$WEATHER" | tr -d ' '
fi
