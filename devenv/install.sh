#!/bin/bash

set -eu
set -o pipefail

# Install zsh
sudo apt-get install -y software-properties-common
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    zsh \
    build-essential \
    tmux \
    curl \
    tree \
    wget \
    git \
    htop \
    unzip \
    p7zip-full \
    pkg-config \
    libevent-dev \
    libncurses-dev \
    ncurses-term \
    sudo \
    zsh \
    locales \
    apt-utils \
    # for Python
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    ## mecab modules
    make \
    xz-utils \
    file \
    mecab \
    libmecab-dev \
    mecab-ipadic \
    mecab-ipadic-utf8 \
    # for neovim build
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    # Ruby
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline-dev \
    zlib1g-dev \
    libncurses5-dev \
    libbz2-dev \
    bzip2 \
    libffi-dev \
    libgdbm-dev

## Install oh-my-zsh
if [ ! -e "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh "$HOME/.oh-my-zsh"
fi

### mkdir ###
if [ ! -e "$HOME/repos" ]; then
  mkdir "$HOME/repos"
fi

if [ ! -e "$HOME/repos/dracula-zsh" ]; then
    git clone https://github.com/dracula/zsh "$HOME/repos/dracula-zsh"
fi
ln -s "$HOME/repos/dracula-zsh/dracula.zsh-theme" "$HOME/.oh-my-zsh/themes/dracula.zsh-theme"

# Install FZF
git clone https://github.com/junegunn/fzf.git "${HOME}/.oh-my-zsh/custom/plugins/fzf"
"${HOME}/.oh-my-zsh/custom/plugins/fzf/install" --bin
git clone https://github.com/Treri/fzf-zsh.git "${HOME}/.oh-my-zsh/custom/plugins/fzf-zsh"

#
if [ ! -e "$HOME/.anyenv" ]; then
    git clone https://github.com/riywo/anyenv "${HOME}/.anyenv"
fi

wget -O - https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh | bash

# Install dotfiles
if [ ! -e "$HOME/dotfiles" ]; then
    git clone https://github.com/tMinamii/dotfiles dotfiles
fi
bash "$HOME/dotfiles/install.sh"


curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb && \
dpkg -i ripgrep_0.10.0_amd64.deb && \
rm ripgrep_0.10.0_amd64.deb

# Install neovim
git clone https://github.com/neovim/neovim repos/neovim
cd repos/neovim
git checkout v0.3.4
make CMAKE_BUILD_TYPE=Release
sudo make install
cd "$HOME"

git clone https://github.com/tmux/tmux repos/tmux
cd repos/tmux
git checkout 2.9
sh autogen.sh
./configure
make
sudo make install
cd "$HOME"

zsh ./setup-langs.sh
