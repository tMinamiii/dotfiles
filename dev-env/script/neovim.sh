#!/bin/zsh
. $HOME/.zshrc
cd $HOME

# mkdir
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi

if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    sudo apt-get install -y neovim
elif uname -a | grep -sq "Darwin"; then
    brew install -y neovim
fi

pip install neovim jedi solargraph-utils.py
pip2 install neovim jedi
gem install solargraph neovim
npm install -g neovim
yard gems
yard config --gem-install-yri

## neovim build tools
#sudo apt install -y cmake libtermkey-dev automake libuv-dev libtool libtool-bin gettext
#git clone https://github.com/neovim/neovim ~/repos/neovim
