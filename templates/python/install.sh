#!/bin/sh
set -Ceu

if [ ! -e ".src" ]; then
  mkdir src
fi
if [ ! -e ".vscode" ]; then
  mkdir .vscode
  curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.vscode/settings.json -o .vscode/settings.json
fi
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.envrc
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.gitignore
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/setup.cfg
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.pre-commit-config.yaml
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/requirements.txt
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/editorconfig
curl -s -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/pyproject.toml
python -m venv .venv
poetry config --local virtualenvs.in-project true
poetry add -D $(cat requirements.txt)
echo
