export DOTFILES=$HOME/dotfiles

source $HOME/.zshrc.local
source $DOTFILES/zsh/alias.zsh
source $DOTFILES/zsh/path.zsh
source $DOTFILES/zsh/plugin.zsh

# Setting history
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history

setopt AUTO_PARAM_KEYS
