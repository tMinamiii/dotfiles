unlink ~/.zshrc
unlink ~/.zshenv
unlink ~/.vim
unlink ~/.config/nvim
unlink ~/.xkb
unlink ~/.tmux.conf

if [ `uname` = "Darwin" ]; then
	rm  ~/Library/Fonts/Ricty*.ttf
elif [ `uname` = "Linux" ]; then
	unlink ~/.fonts
fi
fc-cache -vf
