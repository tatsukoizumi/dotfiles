source ~/.zplug/init.zsh
# Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "mrowa44/emojify", as:command
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if not installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

zplug load
