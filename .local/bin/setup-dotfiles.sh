#!/usr/bin/bash

set -euo pipefail

. $(realpath $(dirname $BASH_SOURCE)/../../.bashrc.d/dotfiles.sh)

dotfiles config --local status.showUntrackedFiles no
dotfiles checkout $HOME -f
