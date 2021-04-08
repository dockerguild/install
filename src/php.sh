#!/bin/sh

dg_php74_install () {
  if ! command -v php7.4 >/dev/null 2>&1; then
    dg_suryphp_install
    sudo apt-get install -y php7.4-cli php7.4-fpm php7.4-zip php7.4-intl php7.4-curl php7.4-xml php7.4-gd php7.4-mbstring php7.4-mysql php7.4-opcache php-apcu
  fi

  php --version
}

dg_php73_install () {
  if ! command -v php7.3 >/dev/null 2>&1; then
    dg_suryphp_install
    sudo apt-get install -y php7.3-cli php7.3-fpm php7.3-zip php7.3-intl php7.3-curl php7.3-xml php7.3-gd php7.3-mbstring php7.3-mysql php7.3-opcache php-apcu
  fi

  php --version
}

dg_suryphp_install () {
    sudo apt-get install -y apt-transport-https lsb-release ca-certificates curl
    if [ ! -f '/etc/apt/trusted.gpg.d/php.gpg' ]; then
      sudo wget https://packages.sury.org/php/apt.gpg -O /etc/apt/trusted.gpg.d/php.gpg
    fi
    if [ ! -f '/etc/apt/sources.list.d/php.list' ]; then
      sudo sh -c "echo 'deb https://packages.sury.org/php/ $(lsb_release -sc) main' > /etc/apt/sources.list.d/php.list"
      sudo apt-get update
    fi
}
