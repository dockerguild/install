#!/bin/sh

dg_zsh_install () {
  if ! command -v zsh >/dev/null 2>&1 || [ ! -f "${HOME}/.zshrc" ]; then
    sudo apt-get install -y zsh curl
    zshrc_config='PROMPT="%%{\44fg[yellow]%%}[%%m@%%n]%%{\44reset_color%%} %%(?:%%{%%}➜ :%%{%%}➜ ) %%{\44fg[cyan]%%}%%c%%{\44reset_color%%} \44(git_prompt_info)"'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh </dev/null
    printf '%b\n' "${zshrc_config}" >> "${HOME}/.zshrc"
    sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh </dev/null
    sudo sh -c "printf '%b\n' \"$(printf '%s' "${zshrc_config}" | sed 's/\(["$]\)/\\\1/g' | sed 's/yellow/red/g')\" >> \"${HOME}/.zshrc\""
  fi
}
