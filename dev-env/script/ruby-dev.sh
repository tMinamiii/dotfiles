#!/bin/zsh

cd $HOME
. "$HOME/.zshrc"
RUBY_VERSION=2.4.4

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

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem install bundler
