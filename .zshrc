# Path to your oh-my-zsh installation.
export ZSH=/Users/dlogvinenko/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git last-working-dir heroku postgres bower nvm node npm zsh-syntax-highlighting command-not-found)

# User configuration
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PATH="/Users/dlogvinenko/.rbenv/shims:/Users/dlogvinenko/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=vim
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim=nvim
alias ls='gls -X -h --group-directories-first --color'
alias grep='grep --color=auto'
alias gips=describe_instances
describe_instances() {
  if [ $1 ]
  then
    aws --profile $1 ec2 describe-instances --query 'Reservations[?Instances[?Tags[?Key == `Stack`].Value | [0] != `Main`]].Instances[].{Name:Tags[?Key==`Name`].Value | [0], Ip:PrivateIpAddress, Status:State.Name, UserData:Tags[?Key==`UserData`].Value | [0]}.sort_by(@, &Name)' --output table
  else
    aws ec2 describe-instances --query 'Reservations[?Instances[?Tags[?Key == `Stack`].Value | [0] != `Main`]].Instances[].{Name:Tags[?Key==`Name`].Value | [0], Ip:PrivateIpAddress, Status:State.Name, UserData:Tags[?Key==`UserData`].Value | [0]}.sort_by(@, &Name)' --output table
  fi
}

alias backup=dotfiles_backup
dotfiles_backup() {
  cp ~/.zshrc $GOPATH/src/github.com/vort3x/dotfiles/.zshrc
  cp ~/.vimrc $GOPATH/src/github.com/vort3x/dotfiles/.vimrc
  cp ~/.psqlrc $GOPATH/src/github.com/vort3x/dotfiles/.psqlrc
}
alias reload='source ~/.zshrc'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Golang
export GOROOT="/usr/local/Cellar/go/1.8/libexec"
export GOPATH="/Users/dlogvinenko/Developer/golang"
export PATH="$GOPATH/bin:$PATH"

# Shortcuts
export DEV=/Users/dlogvinenko/Developer
export WALLESTER="$GOPATH/src/github.com/wallester"
