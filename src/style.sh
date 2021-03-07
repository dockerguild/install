#!/bin/sh

dg_ask () {
  default_value=""
  if [ -n "${3}" ]; then
    default_value=" (${3})"
  fi
  printf "%s${default_value}: " "${2}"
  read -r "${1}"
  if [ -z "$(eval echo "\$${1}")" ]; then
    if [ -z "${3}" ]; then
      readvar "${1}" "${2}" "${3}"
    else
      eval "${1}=\"${3}\""
    fi
  fi
}

dg_title () {
  printf '\n\033[0;33m====================\033[0m\n'
  printf '\033[0;33m%s\033[0m\n' "${1}"
  printf '\033[0;33m====================\033[0m\n'
}
