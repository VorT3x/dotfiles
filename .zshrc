# Path to your oh-my-zsh installation.
export ZSH=/Users/dlogvinenko/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git last-working-dir heroku postgres bower nvm node npm zsh-syntax-highlighting command-not-found)

# User configuration
export PATH="/Users/dlogvinenko/.rbenv/shims:/Users/dlogvinenko/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=vim
source $ZSH/oh-my-zsh.sh

alias ls='gls -X -h --group-directories-first --color'
alias grep='grep --color=auto'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# GO
export GOROOT="/usr/local/Cellar/go/1.7.1/libexec"
export GOPATH="/Users/dlogvinenko/Documents/SoftwareDevelopment/golang"
export PATH="/$GOPATH/bin:$PATH"

# .NET
source dnvm.sh
export MONO_MANAGED_WATCHER=false

# Vim to Neovim ;)
alias vim=nvim

# Shortcut
export DEV=/Users/dlogvinenko/Documents/SoftwareDevelopment
