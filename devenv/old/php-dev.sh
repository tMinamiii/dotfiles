#!/bin/zsh

set -eu
set -o pipefail

cd $HOME
. "$HOME/.zshrc"
PHP_VERSION=7.1.16
APACHE_DIR="$HOME/apache2"
# mkdir
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi
if [ -e /etc/os-release ]; then
    if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
        # php debian ubuntu
        #
        sudo apt-get install flex
        sudo apt-get install bison
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
    fi
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
MSGPACK_DIR="$HOME/repos/msgpack-php"
DEFINITIONS_PATH="$PHPENV_ROOT/plugins/php-build/share/php-build/definitions"
if [ -e /etc/os-release ]; then
    if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
        find $DEFINITIONS_PATH -type f -print | \
            xargs -I{} sh -c "grep -qs with_apxs2 {} || sed -i '1i\with_apxs2 "$APACHE_DIR/bin/apxs"' {}"
    fi
elif uname -a | grep -sq "Darwin"; then
    # Using Gnu sed(gsed) on macOS
    find $DEFINITIONS_PATH -type f -print | \
        xargs -I{} sh -c "grep -qs with_apxs2 {} || gsed -i '1i\with_apxs2 "$APACHE_DIR/bin/apxs"' {}"
fi
# CONFIGURE_OPTS="--with-pear"

install_php(){
    if [ -e /etc/os-release ]; then
        if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
            phpenv install $1
        fi
    elif uname -a | grep -sq "Darwin"; then
        LDFLAGS="-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/system" phpenv install $1
    fi
}

install_php_with_phalcon(){
    install_php $1
    PHPENV_VERSION_ROOT="$PHPENV_ROOT/versions/$1"
    cd $PHALCON_DIR/build
    ./install --phpize "$PHPENV_VERSION_ROOT/bin/phpize" \
        --php-config "$PHPENV_VERSION_ROOT/bin/php-config"
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

if [ ! -e $PHALCON_DIR ]; then
    git clone https://github.com/phalcon/cphalcon $PHALCON_DIR
fi

if [ ! -e $MSGPACK_DIR ]; then
    git clone https://github.com/msgpack/msgpack-php $MSGPACK_DIR
fi

# install_php_with_phalcon $PHP_VERSION
install_php $PHP_VERSION
# install_msgpack $PHP_VERSION
phpenv global $PHP_VERSION
phpenv rehash

## setup phalcon-devtool
PHALCON_DEVTOOLS="$HOME/repos/phalcon-devtools"
if [ ! -e $PHALCON_DEVTOOLS ]; then
    git clone https://github.com/phalcon/phalcon-devtools.git $HOME/repos/phalcon-devtools
fi
cd $HOME/repos/phalcon-devtools

if [ ! -e /usr/local/bin/phalcon ]; then
    if [ -e /etc/os-release ]; then
        if cat /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
            sudo ln -s $(pwd)/phalcon.php /usr/local/bin/phalcon
            sudo chown -R tminami:tminami /usr/local/bin/phalcon
        fi
    elif uname -a | grep -sq "Darwin"; then
        ln -s $(pwd)/phalcon.php /usr/local/bin/phalcon
    fi
fi

