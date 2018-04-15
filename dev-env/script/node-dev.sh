#!/bin/zsh
cd $HOME
. "$HOME/.zshrc"

ndenv install v8.11.1
ndenv global v8.11.1
ndenv rehash
npm i -g npm@latest yarn typescript @types/node
