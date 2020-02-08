export ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH ]; then
	umask g-w,o-w
  REPO=${REPO:-ohmyzsh/ohmyzsh}
  REMOTE=${REMOTE:-https://github.com/${REPO}.git}
  BRANCH=${BRANCH:-master}
	git clone -c core.eol=lf -c core.autocrlf=false \
		-c fsck.zeroPaddedFilemode=ignore \
		-c fetch.fsck.zeroPaddedFilemode=ignore \
		-c receive.fsck.zeroPaddedFilemode=ignore \
		--depth=1 --branch "$BRANCH" "$REMOTE" "$ZSH" || {
		error "git clone of oh-my-zsh repo failed"
		exit 1
	}
	echo
fi

ZSH_THEME="kolo"

plugins=(
  docker
  git
  ripgrep
)


export UPDATE_ZSH_DAYS=7
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

# function nuxt_setup() {
#   echo -n "ok?(y/N): "
#   if read -q; then
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/package.json
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/.eslintrc.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/.eslintignore.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/tsconfig.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/nuxt.config.ts
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/jest.config.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-nuxt/master/index.d.ts
#   else
#     echo abort
#   fi
# }
#
# function react_setup() {
#   echo -n "ok?(y/N): "
#   if read -q; then
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-react/master/.eslintrc.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-react/master/.stylelintrc.js
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/ts-react/master/package.json
#   else
#     echo abort
#   fi
# }
#
# function python_setup () {
#   echo -n "ok?(y/N): "
#   if read -q; then
#     if [ ! -e "/.vscode" ]; then
#       mkdir .vscode
#       curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.vscode/settings.json -o .vscode/settings.json
#     fi
#     # curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.env.workspace
#     # curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.envrc
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.flake8
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.gitignore
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.isort.cfg
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.mypy.ini
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/.pre-commit-config.yaml
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/requirements.txt
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/editorconfig
#     curl -L -O https://raw.githubusercontent.com/tMinamiii/python-template/master/pyproject.toml
#     python -m venv .venv
#     poetry config --local virtualenvs.in-project true
#     poetry add -D $(cat requirements.txt)
#   else
#     echo abort
#   fi
# }


