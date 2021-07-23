#!/bin/bash

set -Ceu

sudo apt install pandoc pandoc-citeproc shellcheck
pip install black flake8 autopep8 pydocstyle isort mypy vim-vint
npm i -g markdownlint-cli textlint
GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
