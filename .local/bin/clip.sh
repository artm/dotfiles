#!/usr/bin/bash

set -euo pipefail

[[ -d /vscode/vscode-server ]] && clipboard_host=host.docker.internal
tee <&0 | socat - "tcp:${clipboard_host:-localhost}:${clipboard_port:-8121}"
