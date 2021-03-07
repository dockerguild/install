#!/bin/sh

dg_iptables_install () {
  if ! command -v iptables >/dev/null 2>&1; then
    sudo apt-get install -y iptables
    sudo cp -vfr "${DGBASEPATH}/.install/iptables/"* /
    sudo iptables-restore -n /etc/iptables.conf
    sudo systemctl enable --now iptables
    sudo systemctl restart iptables
  fi
  sudo iptables --version
  sudo iptables -vnL
}
