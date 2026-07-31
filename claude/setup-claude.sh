#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

echo "setting up claude config..."

mkdir -p $HOME/.claude/skills

# Personal profile (~/.claude)
ln -snfv "$THIS_DIR/personal/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -snfv "$THIS_DIR/personal/settings.json" "$HOME/.claude/settings.json"
ln -snfv "$THIS_DIR/shared/rules" "$HOME/.claude/rules"
ln -snfv "$THIS_DIR/shared/agents" "$HOME/.claude/agents"

# Shared skills (link per skill; ~/.claude/skills may contain other skills)
for skill in "$THIS_DIR"/shared/skills/*/; do
  name=$(basename "$skill")
  ln -snfv "${skill%/}" "$HOME/.claude/skills/$name"
done

# Parent-directory CLAUDE.md for personal repos
if [ -d "$HOME/github" ]; then
  ln -snfv "$THIS_DIR/contexts/github/CLAUDE.md" "$HOME/github/CLAUDE.md"
fi

echo "claude config done"
