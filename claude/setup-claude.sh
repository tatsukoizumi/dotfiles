#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

# Link shared claude config (rules / agents / skills) into a profile dir.
# Usage: setup-claude.sh [extra-profile-dir ...]
#   e.g. setup-claude.sh ~/.claude-work    # link shared config into a second CLAUDE_CONFIG_DIR
link_shared() {
  profile=$1
  mkdir -p "$profile/skills"
  ln -snfv "$THIS_DIR/shared/rules" "$profile/rules"
  ln -snfv "$THIS_DIR/shared/agents" "$profile/agents"
  for skill in "$THIS_DIR"/shared/skills/*/; do
    name=$(basename "$skill")
    ln -snfv "${skill%/}" "$profile/skills/$name"
  done
}

echo "setting up claude config..."

# Personal profile (~/.claude): shared config + personal CLAUDE.md / settings.json
link_shared "$HOME/.claude"
ln -snfv "$THIS_DIR/personal/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -snfv "$THIS_DIR/personal/settings.json" "$HOME/.claude/settings.json"

# Extra profiles (separate CLAUDE_CONFIG_DIR): shared config only.
# CLAUDE.md / settings.json are profile-specific — create them directly in the profile dir.
for extra in "$@"; do
  link_shared "$extra"
done

# Parent-directory CLAUDE.md for personal repos
if [ -d "$HOME/github" ]; then
  ln -snfv "$THIS_DIR/contexts/github/CLAUDE.md" "$HOME/github/CLAUDE.md"
fi

echo "claude config done"
