#!/bin/zsh
. $HOME/.zshrc
## global
cd $HOME
if uname -a | grep -sq "Microsoft"; then
    sudo apt-get install -y flex gperf libtool-bin texinfo libncurses5-dev
    wget http://tamacom.com/global/global-6.6.1.tar.gz
    tar xzf global-6.6.1.tar.gz
    cd $HOME/global-6.6.1
    zsh reconf.sh \
        && ./configure \
        && make \
        && sudo make install
    rm -rf $HOME/global*
fi
