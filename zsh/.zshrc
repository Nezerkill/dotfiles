# ZSH CONFIG

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# ALIASES
alias update='paru -Syu'
alias install='paru -S'
alias remove='paru -Rns'
alias search='paru -Ss'
alias clean='paru -Sc'
alias orphan='paru -Qtdq | paru -Rns -'

alias ls='eza --icons --color=auto'
alias ll='eza -lah --icons --color=auto'
alias la='eza -A --icons --color=auto'
alias lt='eza --tree --icons --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

alias c='clear'
alias h='history'
alias s='sudo'
alias v='micro'
alias cat='bat --style=plain'

alias hr='hyprctl reload'
alias hk='hyprctl keyword'
alias hs='hyprctl systemsinfo'

# ENVIRONMENT
export EDITOR="micro"
export VISUAL="micro"
export TERMINAL="kitty"
export BROWSER="firefox"

# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# KEY BINDINGS
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init

# INTEGRATIONS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
