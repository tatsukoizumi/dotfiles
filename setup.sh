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

# a list of dotfiles
dotfiles=(.zshrc .tmux.conf)

# Create symbolic links
for dotfile in "${dotfiles[@]}"; do
  [ ! -e $dotfile ] && ln -s dotfiles/$file .
done
