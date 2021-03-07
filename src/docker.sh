#!/bin/sh

dg_docker_install () {
  if ! command -v docker >/dev/null 2>&1; then
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
    if [ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ]; then
      curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    fi
    if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
      echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    fi
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker "${USER}"
  fi
  docker --version
}

dg_docker_compose_install () {
  if ! command -v docker-compose >/dev/null 2>&1; then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
  docker-compose --version
}
