#!/bin/sh

dg_iptables_install () {
  file="/etc/iptables.conf"

  if [ ! -x /usr/sbin/iptables ]; then
    sudo apt-get install -y iptables
  fi

  if [ ! -f "${file}" ]; then
    sudo cp -vfr "${DGBASEPATH}/.install/iptables/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/ \(FILTERS.\+\) 127.0.0.1 / \1 ${1} /g" "${file}"
    fi
    if [ -n "${2}" ]; then
      sudo sed -i "s/ \(FILTERS.\+\) 22 / \1 ${2} /g" "${file}"
    fi
    sudo systemctl enable --now iptables
    sudo systemctl restart iptables
  fi

  sudo iptables --version
  sudo iptables -vnL
}

dg_iptables_restore () {
  sudo iptables-restore -n /etc/iptables.conf
  sudo systemctl restart iptables
  sudo iptables -vnL
}
