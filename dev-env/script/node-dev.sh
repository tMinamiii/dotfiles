#!/bin/zsh

. $HOME/.zshrc
cd $HOME
git clone https://github.com/riywo/ndenv ~/.ndenv
~/.ndenv/bin/ndenv init
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build
git clone https://github.com/robotblake/ndenv-update.git "$(ndenv root)/plugins/ndenv-update"

ndenv install v8.10.0
ndenv global v8.10.0
ndenv rehash
npm i -g npm@latest yarn typescript @types/node
