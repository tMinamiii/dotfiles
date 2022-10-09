#!/bin/bash

set -Ceu

function IsUbuntu() {
  [[ $(grep 'NAME="Ubuntu"' /etc/os-release) != "" ]]
}

function IsMacOS() {
  [[ "$(uname)" = "Darwin" ]]
}

function install-go(){
    LATEST_GO_VERSION=$(curl -s 'https://go.dev/dl/?mode=json' | jq -r '[.[]][0].version')

    ARCH=""
    if [[ "$(uname -m)" = "x86_64" ]]; then
        ARCH="amd64"
    elif uname -m | grep -sq "arm64"; then
        ARCH="arm64"
    else
        exit
    fi

    OS=""
    if IsMacOS; then
        OS="darwin"
    elif IsUbuntu; then
        OS="linux"
    else
        exit
    fi

    GOGZ="${LATEST_GO_VERSION}.${OS}-${ARCH}.tar.gz"

    trap 'rm ${GOPKG}' EXIT
    sudo curl -OL --progress-bar "https://go.dev/dl/${GOGZ}"
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "${GOGZ}"
}

if IsMacOS; then
    brew install openssl readline sqlite3 xz zlib tcl-tk rust rustup deno jq
elif IsUbuntu; then
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y \
        apt-utils \
        autoconf \
        automake \
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

    curl -fsSL https://deno.land/install.sh | sh
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

install-go
