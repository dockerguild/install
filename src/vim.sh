#!/bin/sh

dg_vim_install () {
  file="${HOME}/.vimrc"

  if ! command -v vim >/dev/null 2>&1; then
    sudo apt-get install -y vim
  fi

  if [ ! -f "${file}.save" ]; then
    touch "${file}.save"
    if [ -f "${file}" ]; then
      cp -v "${file}" "${file}.save"
    fi
    cp -v "${DGBASEPATH}/.install/home/.vimrc" "${file}"
    printf 'export EDITOR="vim"\n' >> "${HOME}/.profile"
    sudo cp -v "${DGBASEPATH}/.install/home/.vimrc" "/root/.vimrc"
  fi

  vim --version | head -n1
}
