#!/bin/sh
bash install.sh

### setup php language sever ###
composer global config minimum-stability dev
composer global config prefer-stable true
composer global require felixfbecker/language-server
composer global run-script --working-dir="$COMPOSER_HOME/vendor/felixfbecker/language-server parse-stubs"

### setup javascript language sever ###
npm install -g javascript-typescript-langserver
npm install -g vscode-json-languageservice
