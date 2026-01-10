#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

echo "Updating Brewfile..."
cd $THIS_DIR

# Remove existing Brewfile
rm -f Brewfile

# Generate new Brewfile (excluding VSCode extensions)
brew bundle dump --no-vscode

echo "Brewfile updated successfully!"
