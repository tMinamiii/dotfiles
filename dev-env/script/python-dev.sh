#!/bin/zsh
. ./config.sh
. $HOME/.zshrc
cd $HOME
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi

# after zsh and zshrc settings
# install python build tools
if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    sudo apt-get install -y libssl-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        # mecab modules
    sudo apt-get install -y make \
        xz-utils \
        file \
        mecab \
        libmecab-dev \
        mecab-ipadic \
        mecab-ipadic-utf8

    # scrapy modules
    sudo apt-get install -y libxml2-dev \
        libxslt1-dev \
        libffi-dev
elif uname -a | grep -sq "Darwin"; then
    brew instawll -y mecab
fi

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

pyenv install $PY3_VERSION
pyenv install $PY2_VERSION
pyenv global $PY3_VERSION $PY2_VERSION
pyenv rehash

pip install ipython autopep8 pygments flake8 isort numpy scipy

# install jupyter
pip install jupyter jupyterthemes jupyter_contrib_nbextensions
rehash

## setup jupyter extension dir
jupyter contrib nbextension install --user
if [ ! -e $(jupyter --data-dir)/nbextensions ]; then
    mkdir -p $(jupyter --data-dir)/nbextensions
fi
cd $(jupyter --data-dir)/nbextensions
## jupter vim binding
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
## jupyter autopep8
jupyter nbextension install https://github.com/kenkoooo/jupyter-autopep8/archive/master.zip --user
jupyter nbextension enable jupyter-autopep8-master/jupyter-autopep8
## change jupyter theme
jt -t oceans16 -vim

# other modules
#pip install -r requirments.txt
