#!/bin/sh

dg_nginx_install () {
  if [ ! -x /usr/sbin/nginx ]; then
    sudo apt-get install -y nginx-extras openssl
    sudo cp -vfr "${DGBASEPATH}/.install/nginx/"* /
    sudo mkdir -p /etc/nginx/sites-enabled/
    sudo openssl dhparam -out /etc/nginx/certs/dhparams.pem 4096
    sudo service nginx restart
  fi
  /usr/sbin/nginx -V
}
