#!/bin/zsh

set -eu
set -o pipefail

go get -u github.com/kyoshidajp/ghkw
go get -u github.com/mdempsky/gocode
go get -u github.com/mitchellh/colorstring
go get -u github.com/mattn/go-colorable
go get -u github.com/mattn/go-isatty
go get -u github.com/mattn/go-runewidth
go get -u github.com/mitchellh/go-homedir
go get -u github.com/olekukonko/tablewriter
