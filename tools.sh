#!/bin/bash

set -Ceu

function IsUbuntu() {
	[[ $(grep 'name="Ubuntu"' /etc/os-release) != "" ]]
}

function IsMacOS() {
	[[ "$(uname)" = "Darwin" ]]
}

if IsMacOS; then
	brew install \
		bat \
		chafa \
		ctop \
		curl \
		direnv \
		gh \
		ghq \
		git \
		html-xml-utils \
		htop \
		imagemagick \
		jq \
		libsixel \
		lua \
		luajit \
		luarocks \
		mise \
		neovim \
		openssl \
		readline \
		shellcheck \
		sqlite3 \
		tcl-tk \
		tmux \
		unzip \
		vim \
		viu \
		wget \
		whois \
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
		curl \
		dconf-cli \
		direnv \
		file \
		g++ \
		gettext \
		git \
		html-xml-utils \
		htop \
		jq \
		libacl1-dev \
		libbz2-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libgpm-dev \
		libgraphicsmagick1-dev \
		libgtk-3-dev \
		liblua5.1-0 \
		liblua5.1-0-dev \
		libluajit-5.1-dev \
		liblzma-dev \
		libmagickwand-dev \
		libncurses-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libperl-dev \
		libreadline-dev \
		libsixel-bin \
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
		lua5.1 \
		luajit \
		luarocks \
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
	wget

	# install gh
	type -p curl >/dev/null || sudo apt install curl -y
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
		sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
		sudo apt update
	tools="${tools} gh"

	curl https://mise.run | sh
fi
