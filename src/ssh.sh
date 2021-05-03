#!/bin/sh

dg_ssh_install () {
  file="/etc/ssh/sshd_config"

  if ! command -v ssh >/dev/null 2>&1; then
    sudo apt-get install -y openssh-server
  fi

  if [ ! -f "${file}.save" ]; then
    sudo touch "${file}.save"
    if [ -f "${file}" ]; then
      sudo cp -v "${file}" "${file}.save"
    fi
    sudo cp -vfr "${DGBASEPATH}/.install/ssh/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/^\(Port.*\) 22$/\1 ${1}/g" "${file}"
    fi
    sudo service ssh restart
  fi

  ssh -V
}
