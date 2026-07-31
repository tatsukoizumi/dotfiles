# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.local/share/mise/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"

# pnpm
export PNPM_HOME="/Users/koizumitatsunori/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
