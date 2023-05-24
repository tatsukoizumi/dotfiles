source ~/.zplug/init.zsh
# Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "mrowa44/emojify", as:command
zplug "b4b4r07/enhancd", use:init.sh

# Install plugins if not installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

zplug load
