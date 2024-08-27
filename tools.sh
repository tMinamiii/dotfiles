#!/bin/bash

set -Ceu

function IsUbuntu() {
  [[ $(grep 'NAME="Ubuntu"' /etc/os-release) != "" ]]
}

function IsMacOS() {
  [[ "$(uname)" = "Darwin" ]]
}

if IsMacOS; then
    brew install \
      awscli \
      bat \
      ctop \
      direnv \
      gh \
      ghq \
      htop \
      jq \
      lua \
      luajit \
      neovim \
      openssl \
      readline \
      sqlite3 \
      tcl-tk \
      tmux \
      vim \
      xz \
      zlib

    curl https://mise.run | sh
elif IsUbuntu; then
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y \
        apt-utils \
        autoconf \
        automake \
        bat \
        bison \
        build-essential \
        bzip2 \
        cmake \
        cproto \
        dconf-cli \
        direnv \
        file \
        g++ \
        gettext \
        gh \
        html-xml-utils \
        htop \
        jq \
        libacl1-dev \
        libbz2-dev \
        libevent-dev \
        libffi-dev \
        libgdbm-dev \
        libgpm-dev \
        libgtk-3-dev \
        liblua5.2-0 \
        liblua5.2-dev \
        libluajit-5.1-dev \
        liblzma-dev \
        libncurses-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libperl-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libtinfo-dev \
        libtool \
        libtool-bin \
        libxml2-dev \
        libxmlsec1-dev \
        libxmu-dev \
        libxpm-dev \
        libyaml-dev \
        llvm \
        lua5.2 \
        luajit \
        make \
        ncurses-term \
        ninja-build \
        p7zip-full \
        pkg-config \
        python3-dev \
        ripgrep \
        ruby-dev \
        software-properties-common \
        tk-dev \
        tmux \
        tree \
        unzip \
        whois \
        xz-utils \
        zlib1g-dev \
        zsh
    curl https://mise.run | sh
fi

