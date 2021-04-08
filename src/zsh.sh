#!/bin/sh

dg_zsh_install () {
  file="${HOME}/.zshrc"

  if ! command -v zsh >/dev/null 2>&1; then
    sudo apt-get install -y zsh curl
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh </dev/null
    sudo chsh "${USER}" -s /bin/zsh
  fi

  if [ ! -f "${file}.save" ]; then
    touch "${file}.save"
    if [ -f "${file}" ]; then
      cp -v "${file}" "${file}.save"
    fi
    cp -v "${DGBASEPATH}/.install/home/.zshrc" "${file}"
  fi

  zsh --version
}
