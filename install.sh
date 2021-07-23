#!/bin/bash

set -Ceu

if [ ! -e "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

##### initialize #####
if [ -e "$HOME/.zshrc" ]; then
  unlink "$HOME/.zshrc"
fi
if [ -e "$HOME/.vim" ]; then
  unlink "$HOME/.vim"
fi
if [ -e "$HOME/.config/nvim" ]; then
  unlink "$HOME/.config/nvim"
fi
if [ -e "$HOME/.tmux.conf" ]; then
  unlink "$HOME/.tmux.conf"
fi

ARGS=$*

if echo "$ARGS" | grep -sq "\\-\\-gui"; then
  if uname | grep -sq "Darwin"; then
    unlink  "$HOME/Library/Fonts/Cica*.ttf"
  else
    unlink "$HOME/.fonts"
  fi

  if grep -sq "Ubuntu" /etc/os-release; then
    unlink "$HOME/.xprofile"
    unlink "$HOME/.xsessionrc"
    unlink "$HOME/.xkb"
  fi
fi

##### zsh setup #####
if [ -e "$HOME/.zsh" ]; then
  mv "$HOME/.zsh" "$HOME/dotzshbk"
fi

if [ -e "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/dotzshrcbk"
fi


ln -s "$HOME/dotfiles/zsh/zshrc" "$HOME/.zshrc"
# ln -s "$HOME/dotfiles/zsh/zshenv" "$HOME/.zshenv"

###### vim setup ######

if [ ! -e "$HOME/.config/efm-langserver" ]; then
  mkdir "$HOME/.config/efm-langserver"
fi

ln -s "$HOME/dotfiles/vim" "$HOME/.vim"
ln -s "$HOME/dotfiles/vim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/vim/efm-config.yaml" "$HOME/.config/efm-langserver/config.yaml"

###### tmux ######
ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
# ln -s "$HOME/dotfiles/tmux" "$HOME/.tmux.d"

if grep -sq "Ubuntu" /etc/os-release; then
  if [ -z "$WSL_DISTRO_NAME" ]; then
    ## WSLでは設定不要
    gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
    UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "HackGen 13"
  fi
fi

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
