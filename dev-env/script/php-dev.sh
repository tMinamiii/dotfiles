#!/bin/zsh

. ./config.sh
. $HOME/.zshrc
cd $HOME

# mkdir
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi
if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    # php debian ubuntu
    sudo apt-get -y install \
        libbz2-dev \
        build-essential \
        libxml2-dev \
        libcurl4-openssl-dev \
        libjpeg-dev \
        libpng-dev \
        libxpm-dev \
        libmysqlclient-dev \
        libpq-dev \
        libicu-dev \
        libfreetype6-dev \
        libldap2-dev \
        libxslt-dev \
        libmcrypt-dev \
        libtidy-dev \
        libpcre3-dev \
        re2c
    sudo ln -s x86_64-linux-gnu/curl /usr/include/curl
elif uname -a | grep -sq "Darwin"; then
    brew install -y gnu-sed \
        bison\
        re2c \
        autoconf \
        icu4c \
        libmcrypt \
        automake \
        libiconv \
        openssl \
        libxml2 \
        jpeg \
        libpng
    brew link --force bison
    brew link --froce icu4c
fi

# setup phpenv
PHALCON_DIR="$HOME/repos/cphalcon"
PHPENV_ROOT="$HOME/.phpenv"
curl -L http://git.io/phpenv-installer | bash
git clone https://github.com/ngyuki/phpenv-composer $PHPENV_ROOT/plugins/phpenv-composer
git clone https://github.com/phalcon/cphalcon $PHALCON_DIR
git clone https://github.com/msgpack/msgpack-php $HOME/repos/msgpack-php
DEFINITIONS_PATH="$PHPENV_ROOT/plugins/php-build/share/php-build/definitions/"

if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    find $DEFINITIONS_PATH -type f -print | \
        xargs -I{} sh -c "grep -qs with_apxs2 {} || sed -i '1i\with_apxs2 "$APACHE_DIR/bin/apxs"' {}"
elif uname -a | grep -sq "Darwin"; then
    # Using Gnu sed(gsed) on macOS
    find $DEFINITIONS_PATH -type f -print | \
        xargs -I{} sh -c "grep -qs with_apxs2 {} || gsed -i '1i\with_apxs2 "$APACHE_DIR/bin/apxs"' {}"
fi
# CONFIGURE_OPTS="--with-pear"

phpenv_install_with_phalcon(){
    phpenv install $1
    PHPENV_VERSION_ROOT="$PHPENV_ROOT/versions/$1"
    cd $PHALCON_DIR/build
    ./install --phpize $PHPENV_VERSION_ROOT/bin/phpize \
        --php-config $PHPENV_VERSION_ROOT/bin/php-config
    echo "extension=phalcon.so" > $PHPENV_VERSION_ROOT/etc/conf.d/phalcon.ini
    cd $HOME
}

install_msgpack(){
    # setup msgpack-php for phpch.vim
    PHPENV_VERSION_ROOT="$PHPENV_ROOT/versions/$1"
    cd $HOME/repos/msgpack-php
    if echo $1 | grep -sq "^7."; then
        git checkout msgpack-2.0.2
    else
        git checkout msgpack-0.5.7
    fi
    phpenv local $1
    phpize && ./configure --quiet && make && make install && make clean && git clean -f
    echo "extension=msgpack.so" > $PHPENV_VERSION_ROOT/etc/conf.d/msgpack.ini
    cd $HOME
}

#phpenv_install_with_phalcon $PHP72_VERSION
#install_msgpack $PHP72_VERSION
phpenv_install_with_phalcon $PHP71_VERSION
install_msgpack $PHP71_VERSION
#phpenv_install_with_phalcon $PHP70_VERSION
#install_msgpack $PHP70_VERSION
#phpenv_install_with_phalcon $PHP56_VERSION
#install_msgpack $PHP56_VERSION
#phpenv_install_with_phalcon $PHP55_VERSION
#install_msgpack $PHP56_VERSION
phpenv global $PHP71_VERSION
phpenv rehash

## setup phalcon-devtool
git clone https://github.com/phalcon/phalcon-devtools.git $HOME/repos/phalcon-devtools
cd $HOME/repos/phalcon-devtools
sudo ln -s $(pwd)/phalcon.php /usr/local/bin/phalcon
sudo chmod ugo+x /usr/local/bin/phalcon
