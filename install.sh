##### initialize #####
unlink $HOME/.zshrc
unlink $HOME/.zshenv
unlink $HOME/.vim
unlink $HOME/.config/nvim
unlink $HOME/.tmux.conf
unlink $HOME/.tmux.d
ARGS=$*
if `echo $ARGS | grep -sq "\-\-gui"`; then
    if [ `uname` = "Darwin" ]; then
        unlink  $HOME/Library/Fonts/Cica*.ttf
    else
        unlink $HOME/.fonts
    fi

    if cat /etc/os-release | grep -sq "Ubuntu"; then
        unlink $HOME/.xprofile
        unlink $HOME/.xsessionrc
        unlink $HOME/.xkb
    fi
fi

##### zsh setup #####
if [ -e $HOME/.zsh ]; then
    mv $HOME/.zsh $HOME/dotzshbk
fi

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/dotzshrcbk
fi

ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh/zshenv $HOME/.zshenv

###### vim setup ######
if [ ! -e $HOME/.config ]; then
    mkdir .config
fi

ln -s $HOME/dotfiles/vim $HOME/.vim
ln -s $HOME/dotfiles/vim $HOME/.config/nvim

###### tmux ######
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/tmux $HOME/.tmux.d

##### GUI setup #####
if `echo $ARGS | grep -sq "\-\-gui"`; then
    ##### font setup ######
    if [ `uname` = "Darwin" ]; then
        ln -s $HOME/Dropbox/Fonts/Cica*.ttf $HOME/Library/Fonts
        fc-cache -vf
    elif cat /etc/os-release | grep -sq "Ubuntu"; then
        ln -s $HOME/Dropbox/Fonts $HOME/.fonts
        fc-cache -vf
    elif uname -a | grep -sq "Microsoft"; then
        ln -s $HOME/Dropbox/Fonts $HOME/.fonts
        fc-cache -vf
    fi

    if cat /etc/os-release | grep -sq "Ubuntu"; then
        sudo apt-get install gconf2
        gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
        gconftool-2 --get /apps/gnome-terminal/profiles/Default/font
        gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/font "Cica 12"
        ###### Xsession ######
        ln -s $HOME/dotfiles/Xsession/xsessionrc $HOME/.xsessionrc

        ###### xprofile for fcitx ######
        ln -s $HOME/dotfiles/xprofile/xprofile $HOME/.xprofile

        ##### xkb setup #####
        ln -s $HOME/dotfiles/xkb $HOME/.xkb
    fi
fi
