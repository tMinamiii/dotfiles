##### initialize #####
unlink ~/.zshrc
unlink ~/.zshenv
unlink ~/.vim
unlink ~/.config/nvim
unlink ~/.tmux.conf

if [ `uname` = "Darwin" ]; then
    unlink  ~/Library/Fonts/Cica*.ttf
else
    unlink ~/.fonts
fi

if uname -a | grep -sq "Ubuntu"; then
    unlink ~/.xprofile
    unlink ~/.xsessionrc
    unlink ~/.xkb
fi

##### zsh setup #####
if [ -e ~/.zsh ]; then
  mv ~/.zsh ~/dotzshbk
fi

if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/dotzshrcbk
fi

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/zshenv ~/.zshenv

##### xkb setup #####
if uname -a | grep -sq "Ubuntu"; then
    ln -s ~/dotfiles/xkb ~/.xkb
fi
##### font setup ######
if [ `uname` = "Darwin" ]; then
  ln -s ~/Dropbox/Fonts/Cica*.ttf ~/Library/Fonts
  fc-cache -vf
elif uname -a | grep -sq "Ubuntu"; then
  ln -s ~/Dropbox/Fonts ~/.fonts
  fc-cache -vf
elif uname -a | grep -sq "Microsoft"; then
  ln -s ~/Dropbox/Fonts ~/.fonts
  fc-cache -vf
fi


if uname -a | grep -sq "Ubuntu"; then
  sudo apt install gconf2
  gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
  gconftool-2 --get /apps/gnome-terminal/profiles/Default/font
  gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/font "Cica 12"
fi

###### vim setup ######
if [ ! -e ~/.config ]; then
    mkdir .config
fi

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim ~/.config/nvim

###### Xsession ######
if uname -a | grep -sq "Ubuntu"; then
    ln -s ~/dotfiles/Xsession/xsessionrc ~/.xsessionrc
fi

###### xprofile for fcitx ######
if uname -a | grep -sq "Ubuntu"; then
    ln -s ~/dotfiles/xprofile/xprofile ~/.xprofile
fi

###### tmux ######
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
