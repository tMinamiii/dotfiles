##### initialize #####
unlink ~/.zshrc
unlink ~/.zshenv
unlink ~/.fonts
unlink ~/.vim
unlink ~/.config/nvim
unlink ~/.tmux.conf
if [ `uname` = "Darwin" ]; then
    unlink ~/Library/Fonts
fi
if uname -a | grep -sq "Ubuntu"; then
    unlink ~/.xsessionrc
fi

##### zsh setup #####
if [ -e ~/.zsh ]; then
  mv ~/.zsh ~/dotzshbk
fi

if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/dotzshrcbk
fi

ln -s ~/dotfiles/dot.zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/dot.zsh/zshenv ~/.zshenv

##### xkb setup #####
if uname -a | grep -sq "Ubuntu"; then
    ln -s ~/dotfiles/dot.xkb ~/.xkb
fi
##### font setup ######
if [ `uname` = "Darwin" ]; then
  ln -s ~/Dropbox/Fonts/Cica*.ttf ~/Library/Fonts
  fc-cache -vf
elif uname -a | grep -sq "Ubuntu"; then
  ln -s ~/Dropbox/Fonts ~/.fonts
  fc-cache -vf
fi


if uname -a | grep -sq "Ubuntu"; then
  gconftool-2 --get /apps/gnome-terminal/profiles/Default/font
  gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/font "Cica 12"
fi

###### vim setup ######
if [ ! -e ~/.config ]; then
    mkdir .config
fi

ln -s ~/dotfiles/dot.vim ~/.vim
ln -s ~/dotfiles/dot.vim ~/.config/nvim

###### Xsession ######
if uname -a | grep -sq "Ubuntu"; then
    ln -s ~/dotfiles/dot.Xsession/xsessionrc ~/.xsessionrc
fi

###### tmux ######
ln -s ~/dotfiles/dot.tmux/tmux.conf ~/.tmux.conf
