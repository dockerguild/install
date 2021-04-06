#!/bin/sh

dg_mariadb_install () {
  if ! command -v mysql >/dev/null 2>&1; then
    sudo apt-get install -y mariadb-server
  fi

  mysql --version
}
