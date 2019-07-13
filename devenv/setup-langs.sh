#!/usr/bin/zsh

set -eu
set -o pipefail


anyenv install --force-init
mkdir -p "$(anyenv root)/plugins"
git clone https://github.com/znz/anyenv-update.git "$(anyenv root)/plugins/anyenv-update"
anyenv update
anyenv install pyenv
anyenv install nodenv
anyenv install goenv
anyenv install rbenv
pyenv install 2.7.15
pyenv install 3.6.8
pyenv global 3.6.8 2.7.15
pyenv rehash
nodenv install 10.15.3
nodenv global 10.15.3
nodenv rehash
goenv install 1.12.1
goenv global 1.12.1
goenv rehash
rbenv install 2.6.1
rbenv global 2.6.1
rbenv rehash

go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u golang.org/x/tools/cmd/goimports

git clone -b bingo https://github.com/saibing/tools.git repos/tools
cd repos/tools/cmd/gopls
go install
cd -

pip3 install -U pip
pip2 install -U pip
npm i -g npm
# conda install numpy scipy pycodestyle flake8 autopep8 yapf pylint tensorflow pandas matplotlib jupyterlab networkx Faker && \
# pip install pynvim python-language-server && \
pip3 install pynvim neovim numpy scipy pycodestyle flake8 autopep8 yapf pylint python-language-server tensorflow pandas matplotlib jupyterlab networkx Faker vim-vint
pip2 install pynvim neovim
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u golang.org/x/tools/cmd/goimports
cd repos
git clone -b bingo https://github.com/saibing/tools.git
cd tools/cmd/gopls
go install
cd -

npm i -g neovim yarn bash-language-server dockerfile-language-server-nodejs intelephense
gem install neovim

