#!/bin/sh

dg_motd_install () {
  file=/etc/update-motd.d/01-server

  if [ ! -f "${file}" ]; then
    sudo sh -c 'echo "" > /etc/motd'
    sudo rm /etc/update-motd.d/*
    sudo cp -vfr "${DGBASEPATH}/.install/motd/"* /
    sudo chmod +x "${file}"
  fi

  sh "${file}"
}
