#!/bin/bash

# --- 1. ПРОВЕРКА AUR HELPER (Paru) ---
if ! command -v paru &> /dev/null; then
    echo ":: Paru не найден. Устанавливаем..."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    rm -rf paru-bin
fi

# --- 2. УСТАНОВКА ПАКЕТОВ ---
echo ":: Установка пакетов из pkglist.txt..."
# Убедись, что 'htop' (и 'btop', если нужен) есть в pkglist.txt!
paru -S --needed - < pkglist.txt

# Установка Flatpak (Telegram)
echo ":: Проверка Flatpak..."
flatpak install flathub org.telegram.desktop -y

# --- 3. НАСТРОЙКА КОНФИГОВ ---
echo ":: Настройка симлинков..."
mkdir -p ~/.config

# Текущая папка (откуда запущен скрипт)
DOTFILES_DIR=$(pwd)

# Функция для папок в ~/.config (Hyprland, Kitty, Htop и др.)
link_config() {
    NAME=$1
    echo "-> Линкуем папку: $NAME"
    # Удаляем старую папку/ссылку или файл, если он мешает
    rm -rf ~/.config/$NAME
    # Создаем новую ссылку
    ln -s "$DOTFILES_DIR/$NAME" ~/.config/$NAME
}

# --- СПИСОК ПАПОК ---
# Важно: В твоей папке dotfiles должны лежать папки с такими же именами
link_config "hypr"
link_config "waybar"
link_config "swaync"
link_config "rofi"
link_config "kitty"
link_config "fastfetch"
link_config "htop"   # <--- ДОБАВЛЕНО (для ~/.config/htop/htoprc)
# link_config "btop" # <--- Раскомментируй, если решишь перейти на btop

# --- СПЕЦИАЛЬНЫЕ ФАЙЛЫ (ZSH & Starship) ---

echo "-> Линкуем .zshrc"
rm -f ~/.zshrc
ln -s "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

echo "-> Линкуем starship.toml"
rm -f ~/.config/starship.toml
ln -s "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml

# --- ФИНАЛ ---
echo ":: Готово! Все конфиги применены."
echo ":: Перезагрузись или нажми Super+M (Exit), чтобы увидеть изменения."
