# --- ZSH CONFIGURATION ---

# История команд
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# --- ПЛАГИНЫ (Arch Linux Paths) ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- STARSHIP (Промпт) ---
eval "$(starship init zsh)"

# --- АЛИАСЫ (Shortcuts) ---
# Файловые операции (используем eza вместо ls)
alias ls='eza --icons'
alias ll='eza -al --icons --group-directories-first'
alias la='eza -a --icons'
alias tree='eza --tree --icons'

# Замена cat на bat (с подсветкой)
alias cat='bat --style=plain'

# Редакторы
alias v='nvim'

# Система
alias update='paru' # Или 'sudo pacman -Syu'
alias off='shutdown now'
alias reboot='systemctl reboot'

# Git
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'

# Конфиги (быстрый доступ)
alias conf-hypr='nano ~/.config-dev/dotfiles/hypr/hyprland.conf'
alias conf-zsh='nano ~/.config-dev/dotfiles/zsh/.zshrc'
alias conf-waybar='nano ~/.config-dev/dotfiles/waybar/config'

# --- ПРИВЕТСТВИЕ ---
# Запускаем fastfetch при открытии терминала
fastfetch
