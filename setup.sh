#!/bin/bash
set -eu

echo "start setup..."
cd $HOME

echo "Installing Hombebrew ..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
brew update

echo "run brew upgrade ..."
brew upgrade

brew bundle

brew cleanup

zsh_config_file="zsh/.zshrc"
tmux_config_file="tmux/.tmux.conf"

# a list of dotfiles
dotfiles=($zsh_config_file $tmux_config_file)

# Create symbolic links
for dotfile in "${dotfiles[@]}"; do
  [ ! -e $dotfile ] && ln -snfv ./dotfiles/$dotfile .
done

echo "symbolic ilnk created"
