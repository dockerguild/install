#!/bin/sh

dg_ssh_install () {
  file="/etc/ssh/sshd_config"

  if ! command -v ssh >/dev/null 2>&1; then
    sudo apt-get install -y openssh-server
  fi

  if [ ! -f "${file}.save" ]; then
    sudo cp "${file}" "${file}.save"
    sudo cp -vfr "${DGBASEPATH}/.install/ssh/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/22/${1}/g" "${file}"
    fi
    sudo service ssh restart
  fi

  ssh -V
}
