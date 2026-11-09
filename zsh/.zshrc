export DOTFILES=$HOME/dotfiles

source $DOTFILES/zsh/shell-config.zsh
source $DOTFILES/zsh/zinit.zsh
source $DOTFILES/zsh/p10k.zsh
source $DOTFILES/zsh/path.zsh
source $DOTFILES/zsh/alias.zsh
source $DOTFILES/zsh/mise.zsh
source $DOTFILES/zsh/completion.zsh
source $HOME/.zshrc.local

# Android SDK (Java は mise の java@17 を使用)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
