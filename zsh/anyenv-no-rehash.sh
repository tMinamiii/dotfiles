#!/bin/bash
source "/Users/ediplex/.anyenv/libexec/../completions/anyenv.zsh"

anyenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi
  command anyenv "$command" "$@"
}
export GOENV_ROOT="/Users/ediplex/.anyenv/envs/goenv"
export PATH="/Users/ediplex/.anyenv/envs/goenv/bin:$PATH"
export PATH="/Users/ediplex/.anyenv/envs/goenv/shims:${PATH}"
export GOENV_SHELL=zsh
source '/Users/ediplex/.anyenv/envs/goenv/libexec/../completions/goenv.zsh'
goenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(goenv "sh-$command" "$@")";;
  *)
    command goenv "$command" "$@";;
  esac
}
export JENV_ROOT="/Users/ediplex/.anyenv/envs/jenv"
export PATH="/Users/ediplex/.anyenv/envs/jenv/bin:$PATH"
export PATH="/Users/ediplex/.anyenv/envs/jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/Users/ediplex/.anyenv/envs/jenv/libexec/../completions/jenv.zsh'
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
export NDENV_ROOT="/Users/ediplex/.anyenv/envs/ndenv"
export PATH="/Users/ediplex/.anyenv/envs/ndenv/bin:$PATH"
source "/Users/ediplex/.anyenv/envs/ndenv/libexec/../completions/ndenv.zsh"
ndenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`ndenv "sh-$command" "$@"`";;
  *)
    command ndenv "$command" "$@";;
  esac
}
export PHPENV_ROOT="/Users/ediplex/.anyenv/envs/phpenv"
export PATH="/Users/ediplex/.anyenv/envs/phpenv/bin:$PATH"
export PATH="/Users/ediplex/.anyenv/envs/phpenv/shims:${PATH}"
source "/Users/ediplex/.anyenv/envs/phpenv/libexec/../completions/phpenv.zsh"
phpenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `phpenv "sh-$command" "$@"`;;
  *)
    command phpenv "$command" "$@";;
  esac
}
export PYENV_ROOT="/Users/ediplex/.anyenv/envs/pyenv"
export PATH="/Users/ediplex/.anyenv/envs/pyenv/bin:$PATH"
export PATH="/Users/ediplex/.anyenv/envs/pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/Users/ediplex/.anyenv/envs/pyenv/libexec/../completions/pyenv.zsh'
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}
export RBENV_ROOT="/Users/ediplex/.anyenv/envs/rbenv"
export PATH="/Users/ediplex/.anyenv/envs/rbenv/bin:$PATH"
export PATH="/Users/ediplex/.anyenv/envs/rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/Users/ediplex/.anyenv/envs/rbenv/libexec/../completions/rbenv.zsh'
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}
