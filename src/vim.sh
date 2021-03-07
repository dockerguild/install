#!/bin/sh

dg_vim_install () {
  if ! command -v vim >/dev/null 2>&1 || [ ! -f "${HOME}/.vimrc" ]; then
    sudo apt-get install -y vim
    vimrc_config='set mouse-=a\nsyntax enable\ncolorscheme desert\nset background=dark'
    printf '%b\n' "${vimrc_config}" > "/${HOME}/.vimrc"
    sudo sh -c "printf '%b\n' \"${vimrc_config}\" > \"/${HOME}/.vimrc\""
    shrcfile=".bashrc"
    if [ -f "/${HOME}/.zshrc" ]; then
      shrcfile=".zshrc"
    fi
    shrc_config='export EDITOR="vim"'
    printf '%b\n' "${shrc_config}" >> "/${HOME}/${shrcfile}"
    sudo sh -c "printf '%b\n' \"${shrc_config}\" >> \"/${HOME}/${shrcfile}\""
  fi
}
