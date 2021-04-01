#!/bin/sh

dg_iptables_install () {
  file="/etc/iptables.conf"

  if [ ! -x /usr/sbin/iptables ]; then
    sudo apt-get install -y iptables
  fi

  if [ ! -f "${file}" ]; then
    sudo cp -vfr "${DGBASEPATH}/.install/iptables/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/127.0.0.1/${1}/g" "${file}"
    fi
    sudo iptables-restore -n "${file}"
    sudo systemctl enable --now iptables
    sudo systemctl restart iptables
  fi

  sudo iptables --version
  sudo iptables -vnL
}
