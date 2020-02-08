#!/bin/sh
set -Ceu

if [ ! -e "/.vscode" ]; then
  mkdir .vscode
  curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.vscode/settings.json -o .vscode/settings.json
fi
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.env.workspace
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.envrc
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.flake8
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.gitignore
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.isort.cfg
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.mypy.ini
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.pydocstyle
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.pre-commit-config.yaml
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/requirements.txt
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/editorconfig
curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/pyproject.toml
python -m venv .venv
poetry config --local virtualenvs.in-project true
poetry add -D $(cat requirements.txt)
echo
