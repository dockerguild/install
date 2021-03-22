#!/bin/sh

dg_git_install () {
  if ! command -v git >/dev/null 2>&1; then
    sudo apt-get install -y git
  fi
  git --version
}
