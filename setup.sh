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
ln -snfv ./dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -snfv ./dotfiles/git/.gitconfig $HOME/.gitconfig

# Create ghostty config directory and symlink
mkdir -p $HOME/.config/ghostty
ln -snfv "$THIS_DIR/ghostty/config" "$HOME/.config/ghostty/config"

# Create mise config directory and symlink
mkdir -p $HOME/.config/mise
ln -snfv "$THIS_DIR/mise/config.toml" "$HOME/.config/mise/config.toml"

echo "symbolic link created"

touch $HOME/.zshrc.local # to write zsh settings only for local

# Create .gitconfig.local from template if it doesn't exist
if [ ! -f $HOME/.gitconfig.local ]; then
  echo "Creating .gitconfig.local from template..."
  cp $THIS_DIR/git/.gitconfig.local.template $HOME/.gitconfig.local
  echo "Please edit ~/.gitconfig.local with your personal information"
fi

# Install tools via mise
if command -v mise &> /dev/null; then
  echo "Installing tools via mise..."
  mise i
fi

echo "setup done!"
echo "Please run: source ~/.zshrc"
