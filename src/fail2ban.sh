#!/bin/sh

dg_fail2ban_install () {
  file="/etc/fail2ban/jail.conf"

  if ! command -v fail2ban-server >/dev/null 2>&1; then
    sudo apt-get install -y fail2ban
  fi

  if [ ! -f "${file}.save" ]; then
    touch "${file}.save"
    if [ -f "${file}" ]; then
      cp -v "${file}" "${file}.save"
    fi
    sudo cp -vfr "${DGBASEPATH}/.install/fail2ban/"* /
    if [ -n "${1}" ]; then
      sudo sed -i "s/^\(ignoreip\s*=\s*\) 127.0.0.1$/\1 ${1}/g" "${file}"
    fi
    if [ -n "${2}" ]; then
      sudo sed -i "s/^\(port\s*=\s*\) 22$/\1 ${2}/g" "${file}"
    fi
    sudo service fail2ban restart
  fi

  sudo fail2ban-server --version
  sudo fail2ban-client status
}
