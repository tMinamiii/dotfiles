unlink ~/.zsh
unlink ~/.zshrc
unlink ~/.vim
if [ `uname` = "Darwin" ]; then
	rm  ~/Library/Fonts/Ricty*.ttf
elif [ `uname` = "Linux" ]; then
	unlink ~/.fonts
fi
fc-cache -vf
