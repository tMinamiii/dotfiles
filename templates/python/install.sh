#!/bin/sh
set -Ceu

if [ ! -e "/.vscode" ]; then
  mkdir .vscode
  curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.vscode/settings.json -o .vscode/settings.json
fi
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.env.workspace
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.envrc
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.flake8
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.gitignore
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.isort.cfg
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.mypy.ini
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.pydocstyle
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/.pre-commit-config.yaml
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/requirements.txt
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/editorconfig
curl -L -O https://raw.githubusercontent.com/tMinamiii/dotfiles/master/templates/python/pyproject.toml
python -m venv .venv
poetry config --local virtualenvs.in-project true
poetry add -D $(cat requirements.txt)
echo
