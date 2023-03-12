#!/bin/bash

### install programming languages ###
install-go(){
    latest_go_version="$(curl -s 'https://go.dev/dl/?mode=json' | jq -r '[.[]][0].version')"

    local ARCH=""
    [[ "$(uname -m)" = "x86_64" ]] && ARCH="amd64"
    [[ "$(uname -m)" = "arm64" ]] && ARCH="arm64"

    local OS=""
    IsMacOS && OS="darwin"
    IsUbuntu && OS="linux"

    local GOGZ="${latest_go_version}.${OS}-${ARCH}.tar.gz"

    trap 'rm ${GOPKG}' EXIT
    sudo curl -OL --progress-bar "https://go.dev/dl/${GOGZ}" \
      && sudo rm -rf /usr/local/go \
      && sudo tar -C /usr/local -xzf "${GOGZ}"
}

