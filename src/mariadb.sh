#!/bin/sh

dg_mariadb_install () {
  if ! command -v mysql >/dev/null 2>&1; then
    sudo apt-get install -y mariadb-server
    sudo mysql -e "CREATE USER '${1}'@'localhost' IDENTIFIED BY '${2}';"
    sudo mysql -e "CREATE DATABASE ${3};"
    sudo mysql -e "GRANT ALL PRIVILEGES ON ${3}.* TO '${1}'@'localhost';"
    sudo mysql -e "FLUSH PRIVILEGES;"
  fi

  mysql --version
}
