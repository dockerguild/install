#!/bin/sh

dg_hostname_install () {
  sudo sh -c "echo '${1}' > /etc/hostname"
  sudo sh -c "grep -q -F '127.0.0.1 ${1}' /etc/hosts || echo '127.0.0.1 ${1}' >> /etc/hosts"
  sudo hostname "${1}"
}
