# Docker webserver install

## Requirements

    apt-get install -y git

## Usage

    #!/bin/sh

    DGBASEPATH="$(dirname "$(realpath "${0}")")/install"
    if [ ! -d "${DGBASEPATH}" ]; then git clone https://github.com/dockerguild/install.git "${DGBASEPATH}"; fi
    . "${DGBASEPATH}/bootstrap.sh"

    dg_title "Install docker"
    dg_docker_install
    
    dg_title "Install docker-compose"
    dg_docker_compose_install

## Components

### Styles

#### Ask

    dg_ask MY_VAR "My question" "My default response"

#### Title

    dg_title "My title"

### Hash

#### Generate password

    dg_password

### Docker

#### Install docker

    dg_docker_install

#### Install docker-compose

    dg_docker_compose_install

### Certbot

#### Install Certbot

    dg_certbot_install

#### Generate certificate

    dg_certbot_generate "domaine_name.tld" "email_address@domaine_name.tld"

### Nginx

#### Install Nginx

    dg_nginx_install
