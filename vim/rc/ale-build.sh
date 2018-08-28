# PHP
composer global config minimum-stability dev
composer global config prefer-stable true
composer global require squizlabs/php_codesniffer
composer global require friendsofphp/php-cs-fixer
composer global require phpstan/phpstan
# JS TS JSON
# eslint tslint
npm install fixjson
# Ruby
gem install rubocop reek
gem install solargraph

# Python
pip install autopep8 flake8 isort
# YAML
pip install yamllint
# vim script
pip install vim-vint
# Markdown
pip install proselint
npm install -g write-good mdl
# SQL
gem install sqlint

# bash
npm i -g bash-language-server vue-language-server javascript-typescript-langserver

if [ "$(uname)" = "Darwin" ]; then
  # C/CPP
  brew install llvm --with-clang
  if [ ! -e /usr/local/opt/llvm/lib/libclang.so ]; then
    ln -s /usr/local/opt/llvm/lib/libclang.dylib /usr/local/opt/llvm/lib/libclang.so
  fi
  brew install clang-format flawfinder cppcheck
  pip install cpplint
  # Dockerfile
  brew install hadolint
  # Shell
  brew install shellcheck
elif uname -a | grep -sq "Ubuntu"; then
  # C/CPP
  sudo apt-get install -y cppcheck llvm clang clang-format cppcheck  flawfinder
  # Shell
  sudo apt-get install -y shellcheck
  # Dockerfile
  wget -qO- https://get.haskellstack.org/ | sh
  git clone https://github.com/hadolint/hadolint "$HOME/repos/hadolint"
  cd "$HOME/repos/hadolint" || exit
  stack install
  cd - || exit
fi
