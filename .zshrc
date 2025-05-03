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

if [ -f "${ZINIT_HOME}/zinit.zsh" ]; then
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
else
    echo "zinit is not found."
fi

# oh-my-posh
if which oh-my-posh > /dev/null 2>&1; then
    eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.json)"
else
    echo "oh-my-posh is not found."
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

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
