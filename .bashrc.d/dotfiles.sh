export dotfiles_git_dir="$HOME/.config/dotfiles"

dotfiles() {
  git "--git-dir=$dotfiles_git_dir/.git" "--work-tree=$HOME" "$@"
}
