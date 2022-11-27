set -g -x fish_greeting 'Hello FoxyCoder👋🦊... Ur dev setup has been activated🔥⚡'

## Basic Alias
alias vim "nvim"
alias vs "code"
alias lh "ls -lrth"
alias la "ls -la"
alias l "ls -lrt"
alias disk "du -sh"
alias 1cd="cd .."
alias 2cd="cd ../../"
alias 3cd="cd ../../../"
alias 4cd="cd ../../../../"
alias 4cd="cd ../../../../../"
alias c="cd /mnt/c/"
alias d="cd /mnt/d/"
alias e="cd /mnt/e/"
alias f="cd /mnt/f/"

### git alias
alias gs="git status"
alias gi="git init"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push -u"
alias gf="git fetch"
alias gr="git remote"
alias gl="git log"
alias gb="git branch"
alias gpl="git pull"
alias gch="git checkout"
alias gcl="git clone"
alias gm="git merge"
alias gd="git diff"
alias grv="git revert"
alias gcam="git commit -a -m"
alias gca="git commit --amend"

##golang path
set -x GOROOT  /usr/local/go
set -x PATH $PATH $GOROOT/bin

set -x GOPATH $HOME/golibs
set -x PATH $PATH $GOPATH/bin
