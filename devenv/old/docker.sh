#!/bin/zsh
# install docker ce
cd "$HOME" || exit
exec zsh -l
. "$HOME/.zshrc"

if [ -e /etc/os-release ]; then
    if cat /etc/os-release | grep -sq "Ubuntu"; then
        sudo apt-get install -y \
            apt-transport-https \
            ca-certificates \

            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
            "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable"
        sudo apt-get update
        sudo apt-get install docker-ce
    fi
fi
