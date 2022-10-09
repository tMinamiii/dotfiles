#!/bin/bash

set -Ce

[[ -e "$HOME/.zshrc" ]] && unlink ~/.zshrc
[[ -e "$HOME/.vim" ]] && unlink ~/.vim
[[ -e "$HOME/.config/nvim" ]] && unlink ~/.config/nvim
[[ -e "$HOME/.tmux.conf" ]] && unlink ~/.tmux.conf
[[ -e "$HOME/.config/efm-langserver/config.yaml" ]] && unlink "$HOME/.config/efm-langserver/config.yaml"

if [[ $(grep 'NAME="Ubuntu"' /etc/os-release) != "" ]]; then
    [[ -e "$HOME/.xprofile" ]] && unlink ~/.xprofile
    [[ -e "$HOME/.xsessionrc" ]] && unlink ~/.xsessionrc
    [[ -e "$HOME/.xkb" ]] && unlink ~/.xkb
fi

