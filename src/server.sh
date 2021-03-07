#!/bin/sh

dg_server_install () {
  sudo apt-get update
  sudo apt-get dist-upgrade -y
  sudo apt-get install -y htop net-tools make
  sudo apt-get autoremove -y --purge
  sudo apt-get autoclean
}
