#!/bin/sh

dg_fail2ban_install () {
  file="/etc/fail2ban/jail.conf"

  if ! command -v fail2ban-server >/dev/null 2>&1; then
    sudo apt-get install -y fail2ban
  fi

  if [ ! -f "${file}.save" ]; then
    sudo cp "${file}" "${file}.save"
    sudo cp -vfr "${DGBASEPATH}/.install/fail2ban/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/127.0.0.1/${1}/g" "${file}"
    fi
    sudo service fail2ban restart
  fi

  sudo fail2ban-server --version
  sudo fail2ban-client status
}
