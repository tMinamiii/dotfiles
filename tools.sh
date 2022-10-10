#!/bin/bash

set -Ceu

function IsUbuntu() {
  [[ $(grep 'NAME="Ubuntu"' /etc/os-release) != "" ]]
}

function IsMacOS() {
  [[ "$(uname)" = "Darwin" ]]
}

if IsMacOS; then
    brew install openssl readline sqlite3 xz zlib tcl-tk jq bat vim neovim htop ctop
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
        file \
        g++ \
        gettext \
        htop \
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
        llvm
        locales \
        lua5.2 \
        luajit \
        make \
        ncurses-term \
        ninja-build \
        p7zip-full \
        pkg-config \
        python-dev \
        python3-dev \
        ruby-dev \
        software-properties-common \
        tk-dev \
        tree \
        xz-utils \
        zlib1g-dev \
        jq \
        zsh
fi

