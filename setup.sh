set -eu

THIS_DIR=$(pwd)

echo "start setup..."
cd $HOME

# Create symbolic links
ln -snfv ./dotfiles/zsh/.zshrc $HOME/.zshrc

echo "symbolic ilnk created"

touch $HOME/.zshrc.local # to write zsh settings only for local

source $HOME/.zshrc

echo "setup done!"
