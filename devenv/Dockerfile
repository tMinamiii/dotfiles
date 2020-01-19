FROM ubuntu:18.04

ENV USERNAME "tminami"
ENV GROUP "tminami"
ENV PASS "tminami"
ENV DEBIAN_FRONTEND noninteractive
ENV PATH "/home/${USERNAME}/.cargo/bin:$PATH"
ENV PATH "/home/${USERNAME}/.anyenv/bin:$PATH"

RUN apt-get --no-install-recommends update && \
    apt-get upgrade -y && \
    apt-get install -y \
        software-properties-common \
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
        # for build neovim
        libtool \
        libtool-bin \
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
        # && \ apt-get autoremove

RUN locale-gen "en_US.UTF-8" && \
    groupadd -g 1000 "${USERNAME}" && \
    useradd  -g      "${GROUP}" -G sudo -m -s /bin/zsh "${USERNAME}" && \
    chown -R "${USERNAME}":"${GROUP}" /home/"${USERNAME}" && \
    echo "${USERNAME}:${PASS}" | chpasswd && \
    echo "${USERNAME}    ALL=(ALL)      NOPASSWD:ALL" >> /etc/sudoers

# RUN curl -L -O https://github.com/neovim/neovim/releases/download/v0.3.4/nvim-linux64.tar.gz && \
#     tar xzf nvim-linux64.tar.gz && \
#     cp -rf nvim-linux64/* /usr/local && \
#     rm -rf nvim-linux64*

RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb && \
    dpkg -i ripgrep_0.10.0_amd64.deb && \
    rm ripgrep_0.10.0_amd64.deb

# Install neovim
RUN git clone https://github.com/neovim/neovim && \
    cd neovim && \
    git checkout v0.3.4 && \
    make CMAKE_BUILD_TYPE=Release && \
    make install && \
    cd - && \
    rm -rf neovim && \
    git clone https://github.com/tmux/tmux && \
    cd tmux && \
    git checkout 2.9 && \
    sh autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd - && \
    rm -rf tmux

USER $USERNAME
WORKDIR /home/${USERNAME}

## Install oh-my-zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh && \
    mkdir ~/repos && \
    git clone https://github.com/dracula/zsh ~/repos/dracula-zsh && \
    ln -s ~/repos/dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme && \
    # Install FZF
    git clone https://github.com/junegunn/fzf.git ~/.oh-my-zsh/custom/plugins/fzf && \
    ~/.oh-my-zsh/custom/plugins/fzf/install --bin && \
    git clone https://github.com/Treri/fzf-zsh.git ~/.oh-my-zsh/custom/plugins/fzf-zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    # Install dotfiles
    git clone https://github.com/tMinamii/dotfiles ~/dotfiles && \
    bash ~/dotfiles/install.sh && \
    git clone https://github.com/riywo/anyenv ~/.anyenv


SHELL ["/bin/bash", "-c"]
RUN eval "$(anyenv init -)" && \
    anyenv install --force-init && \
    mkdir -p $(anyenv root)/plugins && \
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update && \
    anyenv update && \
    anyenv install pyenv && \
    anyenv install nodenv && \
    anyenv install goenv && \
    anyenv install rbenv

RUN eval "$(anyenv init -)" && \
    # pyenv install anaconda3-2018.12 && \
    # pyenv global anaconda3-2018.12 && \
    pyenv install 2.7.15 && \
    pyenv install 3.6.8 && \
    pyenv global 3.6.8 2.7.15 && \
    pyenv rehash && \
    nodenv install 10.15.3 && \
    nodenv global 10.15.3 && \
    nodenv rehash && \
    goenv install 1.12.1 && \
    goenv global 1.12.1 && \
    goenv rehash && \
    rbenv install 2.6.1 && \
    rbenv global 2.6.1 && \
    rbenv rehash

RUN eval "$(anyenv init -)" && \
    go get -u github.com/golangci/golangci-lint/cmd/golangci-lint && \
    go get -u github.com/saibing/bingo  && \
    go get -u golang.org/x/tools/cmd/goimports

RUN eval "$(anyenv init -)" && \
    pip3 install -U pip && \
    pip2 install -U pip && \
    npm i -g npm && \
    # conda install numpy scipy pycodestyle flake8 autopep8 yapf pylint tensorflow pandas matplotlib jupyterlab networkx Faker && \
    # pip install pynvim python-language-server && \
    pip3 install pynvim neovim numpy scipy pycodestyle flake8 autopep8 yapf pylint python-language-server tensorflow pandas matplotlib jupyterlab networkx Faker && \
    pip2 install pynvim neovim && \
    go get -u github.com/golangci/golangci-lint/cmd/golangci-lint && \
    go get -u golang.org/x/tools/cmd/goimports && \
    cd repos && \
    git clone -b bingo https://github.com/saibing/tools.git && \
    cd tools/cmd/gopls && \
    go install && \
    cd - && \
    npm i -g neovim yarn bash-language-server dockerfile-language-server-nodejs intelephense && \
    gem install neovim

RUN eval "$(anyenv init -)" && \
    nvim +"call dein#install()" +qall && \
    nvim +"UpdateRemotePlugins" +qall

CMD ["/usr/bin/zsh"]
