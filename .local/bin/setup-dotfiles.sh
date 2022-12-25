#!/usr/bin/bash

set -euo pipefail

dotfiles() {
  git "--git-dir=$HOME/.config/dotfiles/.git" "--work-tree=$HOME" "$@"
}

dotfiles config --local status.showUntrackedFiles no
dotfiles checkout $HOME
