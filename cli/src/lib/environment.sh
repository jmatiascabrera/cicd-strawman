#!/usr/bin/env bash

function __osx() {
  # __osx - return if we are running in 'Darwin' (macos)
  [[ $(uname) == "Darwin" ]]
}

function __ubuntu() {
  [[ $(uname) == "Linux" && $(cat /etc/issue | grep -i ubuntu) ]]
}

function noop() {
  echo 'noop' >/dev/null
}
