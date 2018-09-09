#!/bin/bash

function init() {
  echo "alias travis='docker run -it --rm --volume \"\$(pwd)\":/workspace --volume \"\${HOME}/.travis\":$HOME/.travis ${DOCKER_IMAGE}:${TAG}'"
}

function test() {
  echo "Checking whats installed"                    \
    && echo "gem version    ==> $(gem --version)"    \
    && echo "ruby version   ==> $(ruby --version)"   \
    && echo "git version    ==> $(git --version)"    \
    && echo "travis version ==> $(travis --version)" \
    && echo "Woot! Everything checks out, build on!"
}

function shell() {
  bash --login
}

if [ "$1" = "init" ]; then
  init
elif [ "$1" = "test" ]; then
  test
elif [ "$1" = "shell" ]; then
  shell
else
  travis $@
fi
