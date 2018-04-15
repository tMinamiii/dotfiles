#!/bin/zsh

ARGS=$*
#### SETUP ####
zsh initial-setup.sh "$ARGS"
zsh anyenvs.sh
zsh apache2.sh
zsh php-dev.sh
zsh python-dev.sh
zsh node-dev.sh
zsh ruby-dev.sh
zsh neovim.sh
if echo "$ARGS" | grep -sq "\\-\\-docker"; then
    ./docker.sh
fi
