#!/bin/zsh

. $HOME/.zshrc
cd $HOME
if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    sudo apt-get install -y autoconf \
        bison \
        build-essential \
        libssl-dev \
        libyaml-dev \
        libreadline-dev \
        zlib1g-dev \
        libncurses-dev \
        libffi-dev \
        libgdbm3 \
        libgdbm-dev
elif uname -a | grep -sq "Darwin"; then
    brew install openssl libyaml libffi
fi

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
~/.rbenv/bin/rbenv init
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone https://github.com/rkh/rbenv-update.git "$HOME/.rbenv/plugins/rbenv-update"
rehash
rbenv install 2.1.4
rbenv local 2.1.4
rbenv rehash
gem install bundler

rbenv install 2.3.6
rbenv global 2.3.6
rbenv rehash
gem install bundler
