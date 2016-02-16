alias vim='vim -c VSTreeExplore'

# Subversion
alias st='svn st --ignore-externals'
alias svnUp='svn up --ignore-externals'

# Git
alias gst="git status"
alias gru="git remote update"
alias gdl="git log --reverse master..origin/master"
alias grudl="gru && gdl --oneline"
alias grusl="gru && git log --oneline --reverse develop..origin/develop"
alias gt="git tag | sort -V"

alias gb="git status | grep 'On branch'"
alias gl="git log --graph --oneline"
alias gmd="git log --oneline --reverse master..develop"

alias ebash="sudo vim ~/.bashrc"
alias evim="sudo vim /etc/vimrc"

alias ut="phpunit -c app vendor/imc"
alias lut="./vendor/bin/phpunit --coverage-text --colors tests"

# Set timezone to EST
export TZ=America/New_York

# Set vim as default editor
export EDITOR=vim

# [2011-05-13 17:05 EDT][tom@tom-laptop my.environment]$
STARTBLUE='\e[0;34m';
ENDBLUE="\e[0m"
STARTGREEN='\e[0;32m';
ENDGREEN="\e[0m"
#export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"
#export PS1="[\$(date '+%Y-%M-%d %H:%M %Z')][$STARTGREEN\u$ENDGREEN@$STARTBLUE\h$ENDBLUE \W]\$ "
export PS1="[\$(date '+%Y-%m-%d %H:%M %Z')][\u@\h \W]\$ "

# For executing commands like Symfony's console
export PATH=$PATH:./bin
