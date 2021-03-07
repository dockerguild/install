#!/bin/sh

dg_certbot_install () {
  if ! command -v certbot >/dev/null 2>&1; then
    sudo apt-get install -y certbot python-certbot-nginx
  fi
  certbot --version
}

dg_certbot_generate_certonly () {
  certfile="/etc/letsencrypt/renewal/${1}.conf"
  if [ ! -f "${certfile}" ]; then
    sudo certbot certonly --agree-tos --no-eff-email --no-redirect --email "${2}" -d "${1}"
  fi
  cat "${certfile}"
}

dg_certbot_generate_nginx () {
  certfile="/etc/letsencrypt/renewal/${1}.conf"
  if [ ! -f "${certfile}" ]; then
    sudo certbot --nginx --agree-tos --no-eff-email --no-redirect --email "${2}" -d "${1}"
  fi
  cat "${certfile}"
}
