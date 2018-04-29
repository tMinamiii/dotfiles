#!/bin/zsh

set -eu
set -o pipefail
cd $HOME
. "$HOME/.zshrc"
PY3_VERSION=3.6.5
PY2_VERSION=2.7.14
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi

# after zsh and zshrc settings
# install python build tools
if [ -e /etc/os-release ]; then
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
    fi
elif uname -a | grep -sq "Darwin"; then
    brew install -y mecab
fi

# curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update

pyenv install $PY3_VERSION
pyenv install $PY2_VERSION
pyenv global $PY3_VERSION $PY2_VERSION
pyenv rehash

pip3 install --upgrade pip
pip2 install --upgrade pip
pip3 install neovim ipython numpy scipy flake8 autopep8 pep8 jedi jupyter pylint pyflakes Pygments isort
pip2 install neovim jedi

# install jupyter
pip3 install jupyter jupyterthemes jupyter_contrib_nbextensions

## setup jupyter extension dir
jupyter contrib nbextension install --user
if [ ! -e "$(jupyter --data-dir)/nbextensions" ]; then
    mkdir -p "$(jupyter --data-dir)/nbextensions"
fi
cd "$(jupyter --data-dir)/nbextensions"
## jupter vim binding
if [ ! -e "$(jupyter --data-dir)/nbextensions/vim_binding" ]; then
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
fi
jupyter nbextension enable vim_binding/vim_binding
## jupyter autopep8
jupyter nbextension install https://github.com/kenkoooo/jupyter-autopep8/archive/master.zip --user
jupyter nbextension enable jupyter-autopep8-master/jupyter-autopep8
## change jupyter theme
jt -t oceans16 -vim

# other modules
#pip install -r requirments.txt
