#!/bin/sh
. ../../zsh/zshrc
cd "$HOME" || exit
APACHE_DIR="$HOME/apache2"
APACHE_VERSION=2.4.29
### mkdir ###
if [ ! -e ~/repos ]; then
    mkdir ~/repos
fi

if /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    sudo apt-get install -y make libexpat1 libexpat1-dev libpcre3-dev gcc file libssl-dev libnghttp2-dev libldap2-dev libnss3-dev libreadline-dev autoconf
elif uname -a | grep -sq "Darwin"; then
    brew install -y pcre make
fi

wget -q http://ftp.kddilabs.jp/infosystems/apache//httpd/httpd-$APACHE_VERSION.tar.gz
tar xzf httpd-$APACHE_VERSION.tar.gz

wget -q http://ftp.kddilabs.jp/infosystems/apache//apr/apr-1.6.3.tar.gz
tar xzf apr-1.6.3.tar.gz
### APR workaround!!! 
#sed -i -e "s/\$RM \"\$cfgfile\"/\$RM -f \"\$cfgfile\"/g" apr-1.6.3/configure
mv apr-1.6.3 httpd-$APACHE_VERSION/srclib/apr

wget -q http://ftp.kddilabs.jp/infosystems/apache//apr/apr-util-1.6.1.tar.gz
tar xzf apr-util-1.6.1.tar.gz
mv apr-util-1.6.1 httpd-$APACHE_VERSION/srclib/apr-util

cd "httpd-$APACHE_VERSION" || exit
if /etc/os-release | grep -sq "Ubuntu" || uname -a | grep -sq "Microsoft"; then
    ./configure --quiet --prefix="$APACHE_DIR" --with-ldap --with-crypto --with-included-apr && make && make install
elif uname -a | grep -sq "Darwin"; then
    ./configure --quiet --prefix="$APACHE_DIR" --with-ldap -with-crypto --with-included-apr GPP=/usr/bin/cpp CC=/usr/bin/cc && make && make install
fi

cd "$HOME" || exit
rm -rf apr-*.tar.gz
rm -rf httpd-*.tar.gz
rm -rf httpd-$APACHE_VERSION
