##### zsh setup #####
if [ -e ~/.zsh ]; then
  mv ~/.zsh ~/dotzshbk
fi

if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/dotzshrcbk
fi

ln -s ~/dotfiles/dot.zsh/zsh ~/.zsh
ln -s ~/dotfiles/dot.zsh/zshrc ~/.zshrc

##### keymap for thinkpad setup #####
if [ `hostname` = "nch_ThinkPad" ]; then
  ln -s ~/dotfiles/dot.Xmodmap/thinkpad_us_xmodmap ~/.Xmodmap
  ln -s ~/dotfiles/dot.Xmodmap/hhkb_us_xmodmap ~/.hhkbXmodmap
fi

##### font setup ######
if [ `uname` = "Darwin" ]; then
  #brew tap sanemat/font
  #brew uninstall ricty && brew install ricty --vim-powerline --powerline
  ln -s ~/Dropbox/Fonts/Ricty*.ttf ~/Library/Fonts

elif [ `uname` = "Linux" ]; then
  ln -s ~/Dropbox/Fonts ~/.fonts
fi

fc-cache -vf

if uname -a | grep -sq "Ubuntu"; then
  gconftool-2 --get /apps/gnome-terminal/profiles/Default/font
  gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/font "Cica 12"
fi

###### vim setup ######
ln -s ~/dotfiles/dot.vim ~/.vim
ln -s ~/dotfiles/dot.vim ~/.config/nvim
ln -s ~/dotfiles/dot.vim/ideavimrc ~/.ideavimrc

###### Xsession ######
if uname -a | grep -sq "Linux"; then
    ln -s ~/dotfiles/dot.Xsession/xsessionrc ~/.xsessionrc
fi

###### tmux ######
ln -s ~/dotfiles/dot.tmux/tmux.conf ~/.tmux.conf
