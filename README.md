# 🌌 My Hyprland Dotfiles

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-2d3436?style=for-the-badge&logo=hyprland&logoColor=00b8d4)
![Catppuccin](https://img.shields.io/badge/Catppuccin-Mocha-cea0ca?style=for-the-badge&logo=catppuccin&logoColor=white)

Моя персональная конфигурация для **Arch Linux (CachyOS)** на базе **Hyprland**.
Система настроена для максимальной производительности, эстетики (Catppuccin Mocha) и удобства разработки.

![Screenshot](screenshots/preview.png)

## 🛠️ Софт и Инструменты

| Компонент | Название | Описание |
|---|---|---|
| **OS** | CachyOS (Arch) | Базовая система |
| **WM** | Hyprland | Оконный менеджер |
| **Bar** | Waybar | Статус бар |
| **Shell** | Zsh / Fish | Командная оболочка |
| **Terminal** | Kitty | Эмулятор терминала |
| **Launcher** | Rofi | Меню приложений |
| **Notifications** | SwayNC | Центр уведомлений |
| **Scratchpads** | Pyprland | Выпадающие окна (Terminal, Telegram) |
| **Theme** | Catppuccin Mocha | Глобальная цветовая схема |

## ⌨️ Keybindings

**Mod Key:** `Super` (Windows Key)

### 🖥️ Applications & System
| Keybind | Action |
| :--- | :--- |
| `Mod` + `X` | Open Terminal (Kitty) |
| `Mod` + `E` | Open File Manager (Nautilus) |
| `Mod` + `B` | Open Browser (Firefox) |
| `Mod` + `Space` | App Launcher (Rofi) |
| `Mod` + `Esc` | Power Menu (Wlogout) |
| `Mod` + `G` | Lock Screen |
| `Mod` + `Shift` + `M` | Exit Hyprland |

### 🪟 Window Management
| Keybind | Action |
| :--- | :--- |
| `Mod` + `Q` | Close Active Window |
| `Mod` + `F` | Toggle Fullscreen |
| `Mod` + `Alt` + `V` | Toggle Floating Mode |
| `Mod` + `H` / `J` / `K` / `L` | Move Focus (Left/Down/Up/Right) |
| `Mod` + `Shift` + `H` / `J` / `K` / `L` | Move Window (Left/Down/Up/Right) |
| `Mod` + `R` | **Enter Resize Mode** (Use HJKL to resize, ESC to exit) |

### 📦 Workspaces
| Keybind | Action |
| :--- | :--- |
| `Mod` + `1` - `5` | Switch to Workspace 1-5 |
| `Mod` + `Shift` + `1` - `5` | Move Window to Workspace 1-5 |
| `Mod` + `Tab` | Switch to Previous Workspace |
| `Mod` + `Scroll` | Cycle through Workspaces |

### 🛠️ Utilities & Scripts
| Keybind | Action |
| :--- | :--- |
| `Print` | Screenshot (Full Screen) |
| `Mod` + `Shift` + `S` | Screenshot (Select Area) |
| `Mod` + `Print` | Screenshot (Edit in Swappy) |
| `Mod` + `V` | Clipboard History |
| `Mod` + `.` | Emoji Picker |
| `Mod` + `T` | Toggle Telegram (Scratchpad) |
| `Mod` + `N` | Toggle Notifications Center |
| `Mod` + `F1` | Toggle Game Mode |

### 💻 Laptop Function Keys
| Key | Action |
| :--- | :--- |
| `F2` / `F3` (Audio) | Volume Down / Up |
| `F1` (Mute) | Mute Audio |
| `F5` / `F6` (Bright) | Brightness Down / Up |
| `Lid Close` | Lock Screen |

## 🚀 Установка

Для развертывания на новой машине (требуется установленный Git):

```bash
# 1. Создаем директорию разработки (моя структура)
mkdir -p ~/.config-dev

# 2. Клонируем репозиторий
git clone [https://github.com/Nezerkill/dotfiles.git](https://github.com/Nezerkill/dotfiles.git) ~/.config-dev/dotfiles

# 3. Заходим внутрь и запускаем установщик
cd ~/.config-dev/dotfiles
chmod +x install.sh
./install.sh
