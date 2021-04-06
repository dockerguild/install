#!/bin/sh

dg_php74_install () {
  if ! command -v php >/dev/null 2>&1; then
    sudo apt-get install -y php7.4-cli php7.4-fpm php7.4-zip php7.4-intl php7.4-curl php7.4-xml php7.4-gd php7.4-mbstring php7.4-mysql php7.4-opcache php-apcu
  fi

  php --version
}
