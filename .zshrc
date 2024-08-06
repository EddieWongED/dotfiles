# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eddie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Update grub
alias update-grub="grub-mkconfig -o /boot/grub/grub.cfg"

# Reload waybar
alias reload-waybar="pkill waybar && hyprctl dispatch exec waybar"
