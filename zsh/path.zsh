# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
# curl
export PATH="/usr/local/opt/curl/bin:$PATH"
#[ -f "/Users/tatsukoizumi/.ghcup/env" ] && source "/Users/tatsukoizumi/.ghcup/env" # ghcup-env
[ -f "/Users/tatsukoizumi/.ghcup/env" ] && source "/Users/tatsukoizumi/.ghcup/env" # ghcup-env

eval "$(nodenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
