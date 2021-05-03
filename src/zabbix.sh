#!/bin/sh

dg_zabbix_install () {
  file="/etc/zabbix/zabbix_agentd.conf"

  if [ ! -x /usr/share/zabbix-agent ]; then
    wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+buster_all.deb -O /tmp/zabbix.deb
    sudo dpkg -i /tmp/zabbix.deb
    rm /tmp/zabbix.deb
    sudo apt-get update
    sudo apt-get install -y zabbix-agent
    sudo systemctl enable zabbix-agent
  fi

  if [ ! -f "${file}.save" ]; then
    sudo touch "${file}.save"
    if [ -f "${file}" ]; then
      sudo cp -v "${file}" "${file}.save"
    fi
    sudo cp -vfr "${DGBASEPATH}/.install/zabbix/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/^\(Server=\)127.0.0.1/\1${1}/g" "${file}"
    fi
    if grep -q docker /etc/group; then
      sudo gpasswd -a zabbix docker
    fi
    sudo service zabbix-agent restart
  fi

  sudo zabbix_agentd --version | head -n2
}
