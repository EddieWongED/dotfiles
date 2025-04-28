# history
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# env
EDITOR=nano
XDG_CONFIG_HOME=~/.config

# bind
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ -x "$(command -v git)" ] && [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# completion
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color -a $realpath'

# oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.json)"
fi

# tmux plugin manager
TPM_HOME="${HOME}/.tmux/plugins/tpm"

if [ -x "$(command -v git)" ] && [ -x "$(command -v tmux)" ] && [ ! -d "$TPM_HOME" ]; then
    mkdir -p "$(dirname $TPM_HOME)"
    git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
fi

# bat
alias cat="bat --color=always"

# ls
alias ls="ls --color -a"

# Update grub
alias update-grub="grub-mkconfig -o /boot/grub/grub.cfg"

# Reload waybar
alias reload-waybar="pkill waybar && hyprctl dispatch exec waybar"

# Reload swaync
alias reload-swaync="pkill swaync && hyprctl dispatch exec swaync"

# GPU
alias test-gpu="__GL_SYNC_TO_VBLANK=0 vblank_mode=0 glxgears"

# fzf
eval "$(fzf --zsh)"

# fastfetch
fastfetch

