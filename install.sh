#!/bin/bash

set -Ce

[[ ! -e "$HOME/.config" ]] && mkdir "$HOME/.config"

[[ -e "$HOME/.zshrc" ]] && unlink "$HOME/.zshrc"
[[ -e "$HOME/.vim" ]] && unlink "$HOME/.vim"
[[ -e "$HOME/.config/.ideavimrc" ]] && unlink "$HOME/.config/.ideavimrc"
[[ -e "$HOME/.config/nvim" ]] && unlink "$HOME/.config/nvim"
[[ -e "$HOME/.tmux.conf" ]] && unlink "$HOME/.tmux.conf"

##### zsh setup #####
[[ -e "$HOME/.zsh" ]] && mv "$HOME/.zsh" "$HOME/dotzshbk"
[[ -e "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/dotzshrcbk"
[[ ! -e "$HOME/.config/efm-langserver" ]] && mkdir "$HOME/.config/efm-langserver"

ln -s "$HOME/dotfiles/zsh/zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/vim" "$HOME/.vim"
ln -s "$HOME/dotfiles/vim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/vim/ideavimrc" "$HOME/.config/.ideavimrc"
ln -s "$HOME/dotfiles/vim/efm-config.yaml" "$HOME/.config/efm-langserver/config.yaml"
ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

# ARGS=$*
#
# if echo "$ARGS" | grep -sq "\\-\\-gui"; then
#   if uname | grep -sq "Darwin"; then
#     unlink  "$HOME/Library/Fonts/Cica*.ttf"
#   else
#     unlink "$HOME/.fonts"
#   fi
#
#   if grep -sq "Ubuntu" /etc/os-release; then
#     unlink "$HOME/.xprofile"
#     unlink "$HOME/.xsessionrc"
#     unlink "$HOME/.xkb"
#   fi
# fi

# if grep -sq "Ubuntu" /etc/os-release; then
#   if [ -z "$WSL_DISTRO_NAME" ]; then
#     ## WSLでは設定不要
#     gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
#     UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
#     gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "HackGen 13"
#   fi
# fi
#
##### GUI setup #####
# if echo "$ARGS" | grep -sq "\\-\\-gui"; then
#   ##### font setup ######
#   if uname | grep -sq "Darwin"; then
#     ln -s "$HOME/Dropbox/Fonts/Cica*.ttf" "$HOME/Library/Fonts"
#     fc-cache -vf
#   elif grep -sq "Ubuntu" /etc/os-release; then
#     ln -s "$HOME/Dropbox/Fonts" "$HOME/.fonts"
#     fc-cache -vf
#   elif uname -a | grep -sq "Microsoft"; then
#     ln -s "$HOME/Dropbox/Fonts" "$HOME/.fonts"
#     fc-cache -vf
#   fi
#
#   if grep -sq "Ubuntu" /etc/os-release; then
#     gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
#     UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
#     gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "HackGen 13"
#
#     ###### Xsession ######
#     # ln -s "$HOME/dotfiles/Xsession/xsessionrc" "$HOME/.xsessionrc"
#
#     ###### xprofile for fcitx ######
#     # ln -s "$HOME/dotfiles/xprofile/xprofile" "$HOME/.xprofile"
#
#     ##### xkb setup #####
#     # ln -s "$HOME/dotfiles/xkb" "$HOME/.xkb"
#   fi
# fi
