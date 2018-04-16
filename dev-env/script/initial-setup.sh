#!/bin/zsh

ARGS=$*
cd "$HOME" || exit

### mkdir ###
if [ ! -e "$HOME/repos" ]; then
  mkdir "$HOME/repos"
fi

# Install zsh
#
if [ -e /etc/os-release ]; then
    if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
        sudo apt-get update 
        sudo apt-get install -y zsh
    fi
elif uname -a | grep -sq "Darwin"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install -y zsh
fi
git config --global http.sslVerify false
## Install oh-my-zsh
if [ ! -e "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh "$HOME/.oh-my-zsh"
fi

if [ ! -e "$HOME/repos/dracula-zsh" ]; then
    git clone https://github.com/dracula/zsh "$HOME/repos/dracula-zsh"
fi
ln -s "$HOME/repos/dracula-zsh/dracula.zsh-theme" "$HOME/.oh-my-zsh/themes/dracula.zsh-theme"

# Install Common tools
if [ -e /etc/os-release ]; then
    if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
        sudo apt-get update 
        sudo apt-get install -y curl \
            tree \
            wget \
            git \
            git-flow \
            cpulimit \
            htop \
            tmux \
            unzip \
            avahi-utils \
            build-essential \
            software-properties-common \
            pkg-config \
            libevent-dev \
            libncurses-dev \
            ncurses-term
    fi
elif uname -a | grep -sq "Darwin"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install -y curl wget htop tmux git git-flow tree ncurses
  brew link --force ncurses
  xcode-select --install
fi

if [ ! -e "$HOME/.anyenv" ]; then
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
fi
# Install dotfiles
if [ ! -e "$HOME/dotfiles" ]; then
    git clone https://github.com/naronA/dotfiles dotfiles
fi
if echo "$ARGS" | grep -sq "\\-\\-gui"; then
    zsh "$HOME/dotfiles/install.sh" --gui
else
    zsh "$HOME/dotfiles/install.sh"
fi

# setup for Windows Subsystem for Linux
if uname -a | grep -sq "Microsoft"; then
    sudo sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
    sudo apt-get update
    cd "$HOME/repos" || exit
    wget https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip win32yank-x64.zip
    rm -rf win32yank-x64.zip
    sudo cp win32yank-x64/win32yank.exe /usr/bin/win32yank
    ## tmux build tools
    sudo apt-get -y install libevent-dev
    git clone https://github.com/tmux/tmux "$HOME/repos/tmux"
fi

## tensorflow modules
if echo "$ARGS" | grep -sq "\\-\\-tensorflow"; then
    if [ -e /etc/os-release ]; then
        if cat /etc/os-release | grep -sq "Ubuntu"; then
            sudo apt-get update 
            sudo apt-get install -y libibverbs-dev \
                librdmacm-dev \
                libcupti-dev \
                openjdk-8-jdk
            git clone https://github.com/tensorflow/tensorflow "$HOME/repos/tensorflow"

            ## bazel
            echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
            curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
            sudo apt-get update && sudo apt-get install -y bazel
        fi
    fi
fi
