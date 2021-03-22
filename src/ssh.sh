#!/bin/sh

dg_ssh_install () {
  if ! command -v ssh >/dev/null 2>&1; then
    sudo apt-get install -y openssh-server
    sudo cp -vfr "${DGBASEPATH}/.install/ssh/"* /
  fi
  ssh -V
}
