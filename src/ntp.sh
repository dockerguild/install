#!/bin/sh

dg_ntp_install () {
  if [ ! -x /usr/sbin/ntpdate ]; then
    sudo rm /etc/localtime
    sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
    sudo sh -c "echo 'Europe/Paris' > /etc/timezone"
    sudo apt-get install -y ntp ntpdate
    sudo service ntp stop
    sudo ntpdate pool.ntp.org
    sudo service ntp start
  fi
  sudo ntpdate -v 2>&1 | head -n1
  cat /etc/timezone
}
