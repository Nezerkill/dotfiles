#!/bin/bash

# AUR HELPER
if ! command -v paru &> /dev/null; then
    echo ":: Paru не найден. Устанавливаем..."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    rm -rf paru-bin
fi

# УСТАНОВКА ПАКЕТОВ
echo ":: Установка пакетов из pkglist.txt..."
paru -S --needed - < pkglist.txt

# FLATPAK
echo ":: Проверка Flatpak..."
flatpak install flathub org.telegram.desktop -y

# СИМЛИНКИ
echo ":: Настройка симлинков..."
mkdir -p ~/.config

DOTFILES_DIR=$(pwd)

link_config() {
    NAME=$1
    if [ -d "$DOTFILES_DIR/$NAME" ]; then
        echo "-> Линкуем папку: $NAME"
        rm -rf ~/.config/$NAME
        ln -s "$DOTFILES_DIR/$NAME" ~/.config/$NAME
    else
        echo "-> Пропущено: $NAME (папка не найдена)"
    fi
}

link_config "hypr"
link_config "waybar"
link_config "swaync"
link_config "rofi"
link_config "kitty"
link_config "fastfetch"
link_config "htop"
link_config "mpv"

# ZSH & STARSHIP
echo "-> Линкуем .zshrc"
rm -f ~/.zshrc
ln -s "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

echo "-> Линкуем starship.toml"
rm -f ~/.config/starship.toml
ln -s "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml

# ФИНАЛ
echo ":: Готово! Все конфиги применены."
echo ":: Перезагрузись или нажми Super+M (Exit), чтобы увидеть изменения."
