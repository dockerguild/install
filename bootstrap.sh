#!/bin/sh

if [ -z "${DGBASEPATH}" ]; then
  echo "Please create \$DGBASEPATH variable"
  exit
fi

for fsrc in "${DGBASEPATH}/src/"*.sh; do . "${fsrc}"; done
