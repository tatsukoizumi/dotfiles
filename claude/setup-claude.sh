#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)
DOTFILES_DIR=$(dirname "$THIS_DIR")

# Skills and agents ship as the koizumi plugin (shared/.claude-plugin/plugin.json):
# cloud sessions never read ~/.claude, but they do load plugins.
# Rules stay symlinked because plugins cannot inject always-on instructions.
link_rules() {
  profile=$1
  mkdir -p "$profile"
  ln -snfv "$THIS_DIR/shared/rules" "$profile/rules"
}

install_plugin() {
  claude plugin marketplace add "$DOTFILES_DIR" || true
  claude plugin install koizumi@koizumi-dotfiles || true
}

echo "setting up claude config..."

# Personal profile (~/.claude): shared config + personal CLAUDE.md / settings.json
link_rules "$HOME/.claude"
install_plugin
ln -snfv "$THIS_DIR/personal/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -snfv "$THIS_DIR/personal/settings.json" "$HOME/.claude/settings.json"

# Extra profiles (separate CLAUDE_CONFIG_DIR): shared config only.
# CLAUDE.md / settings.json are profile-specific — create them directly in the profile dir.
for extra in "$@"; do
  link_rules "$extra"
  (export CLAUDE_CONFIG_DIR="$extra"; install_plugin)
done

# Parent-directory CLAUDE.md for personal repos
if [ -d "$HOME/github" ]; then
  ln -snfv "$THIS_DIR/contexts/github/CLAUDE.md" "$HOME/github/CLAUDE.md"
fi

echo "claude config done"
