set -eu

THIS_DIR=$(pwd)

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

brew bundle install --file "${THIS_DIR}/brew/Brewfile"

brew cleanup

# Create symbolic links
ln -snfv ./dotfiles/zsh/.zshrc $HOME/.zshrc

echo "symbolic ilnk created"

touch $HOME/.zshrc.local # to write zsh settings only for local

source $HOME/.zshrc

echo "setup git aliases"
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.co checkout

echo "setup done!"
