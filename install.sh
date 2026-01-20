#!/bin/bash

# 1. Проверяем наличие AUR помощника (yay или paru)
if ! command -v paru &> /dev/null; then
    echo ":: Paru не найден. Устанавливаем..."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    rm -rf paru-bin
fi

# 2. Установка пакетов из списка
echo ":: Установка пакетов из pkglist.txt..."
# Читаем файл и скармливаем его paru (он умеет и repo, и AUR)
paru -S --needed - < pkglist.txt

# 3. Настройка Flatpak (если нужен Telegram)
echo ":: Проверка Flatpak..."
flatpak install flathub org.telegram.desktop -y

# 4. Создание структуры папок
echo ":: Настройка конфигов..."
mkdir -p ~/.config

# Путь к твоему репозиторию (предполагаем, что мы запускаем скрипт ИЗ папки репозитория)
DOTFILES_DIR=$(pwd)

# Функция для создания симлинков
link_config() {
    NAME=$1
    # Удаляем старый конфиг/папку, если есть
    rm -rf ~/.config/$NAME
    # Создаем ссылку
    ln -s $DOTFILES_DIR/$NAME ~/.config/$NAME
    echo "-> Ссылка для $NAME создана"
}

# --- СПИСОК ТОГО, ЧТО ЛИНКУЕМ ---
# Добавь сюда свои папки
link_config "hypr"
link_config "waybar"
link_config "swaync"
link_config "rofi"
link_config "kitty"
# link_config "nvim" 

echo ":: Готово! Перезагрузись."
