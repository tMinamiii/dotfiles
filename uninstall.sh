unlink ~/.zshrc
unlink ~/.zshenv
unlink ~/.vim
unlink ~/.config/nvim
unlink ~/.tmux.conf

if uname | grep -sq "Darwin"; then
    unlink  ~/Library/Fonts/Cica*.ttf
else
    unlink ~/.fonts
fi

if uname -a | grep -sq "Ubuntu"; then
    unlink ~/.xprofile
    unlink ~/.xsessionrc
    unlink ~/.xkb
fi

