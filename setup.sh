#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."

# Install Homebrew packages
if command -v brew &> /dev/null; then
  echo "Installing Homebrew packages..."
  brew bundle --file=$THIS_DIR/Brewfile
else
  echo "Homebrew is not installed. Please install Homebrew first."
  echo "Visit: https://brew.sh"
fi

cd $HOME

# Create symbolic links
ln -snfv ./dotfiles/zsh/.zshrc $HOME/.zshrc

echo "symbolic link created"

touch $HOME/.zshrc.local # to write zsh settings only for local

echo "setup done!"
echo "Please run: source ~/.zshrc"
