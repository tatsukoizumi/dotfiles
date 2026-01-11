#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."

# Install Homebrew packages
if command -v brew &> /dev/null; then
  echo "Installing Homebrew packages..."
  brew bundle --file=$THIS_DIR/brew/Brewfile
else
  echo "Homebrew is not installed. Please install Homebrew first."
  echo "Visit: https://brew.sh"
fi

cd $HOME

# Create symbolic links
ln -snfv ./dotfiles/zsh/.zshrc $HOME/.zshrc
ln -snfv ./dotfiles/git/.gitconfig $HOME/.gitconfig

# Create ghostty config directory and symlink
mkdir -p $HOME/.config/ghostty
ln -snfv "$THIS_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo "symbolic link created"

touch $HOME/.zshrc.local # to write zsh settings only for local

# Create .gitconfig.local from template if it doesn't exist
if [ ! -f $HOME/.gitconfig.local ]; then
  echo "Creating .gitconfig.local from template..."
  cp $THIS_DIR/git/.gitconfig.local.template $HOME/.gitconfig.local
  echo "Please edit ~/.gitconfig.local with your personal information"
fi

echo "setup done!"
echo "Please run: source ~/.zshrc"
