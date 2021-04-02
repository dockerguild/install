#!/bin/sh

dg_vim_install () {
  file="${HOME}/.vimrc"

  if ! command -v vim >/dev/null 2>&1; then
    sudo apt-get install -y vim
  fi

  if [ ! -f "${file}.save" ]; then
    cp "${file}" "${file}.save"
    cp -v "${DGBASEPATH}/.install/home/.vimrc" "${file}"
    printf 'export EDITOR="vim"\n' >> "${HOME}/.profile"
  fi

  vim --version | head -n1
}
