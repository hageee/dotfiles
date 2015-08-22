source ~/dotfiles/.zsh.d/zshenv

# 追加の環境変数などはこのファイルに定義

export EDITOR=vi
export RACK_ENV=development

CERT_FILE=/usr/local/Cellar/curl-ca-bundle/1.87/share/ca-bundle.crt

if [ -e "$CERT_FILE" ]; then
  export SSL_CERT_FILE=$CERT_FILE
fi

PATH=$PATH:$HOME/script

## For ruby
# rvm
if [ -e "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# rbenv
if [ -e "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# For node.js
# nodebrew
if [ -e "$HOME/.nodebrew" ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# For android-sdk
ADT_PATH=$HOME/Develop/tools/adt/current
if [ -e "$ADT_PATH" ]; then
    export PATH=$ADT_PATH/sdk/tools:$PATH
    export PATH=$ADT_PATH/sdk/platform-tools:$PATH
fi

export GOPATH=$HOME/gocode
PATH=$PATH:$GOPATH/bin

if [ -e "${HOME}/.phpenv" ]; then
    export PATH="${HOME}/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
fi
PATH=$PATH:${HOME}/pear/bin
