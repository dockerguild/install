#!/bin/sh

dg_fail2ban_install () {
  if ! command -v fail2ban-server >/dev/null 2>&1; then
    sudo apt-get install -y fail2ban
    sudo cp -vfr "${DGBASEPATH}/.install/fail2ban/"* /
    sudo service fail2ban restart
  fi
  sudo fail2ban-server --version
  sudo fail2ban-client status
}
