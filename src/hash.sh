#!/bin/sh

dg_generate_password () {
  tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1
}
