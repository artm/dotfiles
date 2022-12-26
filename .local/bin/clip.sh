#!/usr/bin/bash

set -euo pipefail

for i in "$@"
do
  case "$i" in
  (-i|-in|--input)
    tee <&0 | socat - "tcp:host.docker.internal:${clipboard_port:-8121}"
    exit 0
    ;;
  esac
done
