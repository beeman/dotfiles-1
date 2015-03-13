# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/opt/X11/lib/pkgconfig

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

. ~/.luizalabs

# GIT ALIASES
#
alias gs='git status'
alias gl='git log'
alias gp='git push'
alias ga='git add -A'
alias gd='git diff'
alias gu='git add -u'
alias gau='git add --update'
alias gc='git commit -m'
alias gb='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpu='git pull'
alias gpo='git push origin'
alias gfp='git fetch -p'

# Docker ALIASES
alias dp='docker pull'
alias dc='docker create'

# golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# java
export JAVA_HOME=$(/usr/libexec/java_home)

# forgot Sudo
alias fuck='sudo $(history -p \!\!)' 

# qfind
qfind () {
      find . -exec grep -l -s $1 {} \;
        return 0
}
