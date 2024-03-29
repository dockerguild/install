#!/bin/sh

dg_certbot_install () {
  if ! command -v certbot >/dev/null 2>&1; then
    sudo apt-get install -y certbot python3-certbot-nginx
  fi
  certbot --version
}

dg_certbot_generate_certonly () {
  certfile="/etc/letsencrypt/renewal/${1}.conf"
  if [ ! -f "${certfile}" ]; then
    sudo certbot certonly --rsa-key-size 4096 --agree-tos --no-eff-email --no-redirect --email "${2}" -d "${1}" -d "www.${1}"
  fi
  cat "${certfile}"
}

dg_certbot_generate_nginx () {
  certfile="/etc/letsencrypt/renewal/${1}.conf"
  if [ ! -f "${certfile}" ]; then
    sudo certbot --rsa-key-size 4096 --nginx --agree-tos --no-eff-email --no-redirect --email "${2}" -d "${1}" -d "www.${1}"
  fi
  cat "${certfile}"
}
