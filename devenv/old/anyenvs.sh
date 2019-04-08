#!/bin/zsh

cd $HOME
. "$HOME/.zshrc"
anyenv install phpenv
anyenv install rbenv
anyenv install ndenv
anyenv install pyenv
anyenv install goenv

mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
