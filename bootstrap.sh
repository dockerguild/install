#!/bin/sh

if [ -z "${DGBASEPATH}" ]; then
  echo "Please create \$DGBASEPATH variable"
  exit
fi

for futils in "${DGBASEPATH}/src/"*.sh; do . "${futils}"; done
