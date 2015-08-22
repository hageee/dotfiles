source ~/dotfiles/.zsh.d/zshrc

# 追加の設定などはこのファイルに定義

alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ls="ls -aFG"
alias ll="ls -lh"

alias emacs='TERM=xterm-256color /usr/local/Cellar/emacs/24.3/bin/emacs -nw'
alias e='TERM=xterm-256color /usr/local/Cellar/emacs/24.3/bin/emacs -nw'

# Cot Editor
alias cot='open $1 -a /Applications/CotEditor.app'
# Bundler
alias be='bundle exec'
alias bes='bundle exec spring'

# PostgreSQL
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'
# Git
alias gad='git add'
alias gbr='git branch'
alias gcm='git commit'
alias gco='git checkout'
alias glg='git log'
alias gmg='git merge'
alias gpl='git pull'
alias gps='git push'
alias grb='git rebase'
alias grl='git reflog'
alias grmt='git remote'
alias grt='git reset'
alias grm='git rm'
alias gst='git status'
alias gd='git diff'
alias gdt='git difftool --dir-diff'

setopt nonomatch

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
