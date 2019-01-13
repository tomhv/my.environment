alias vim='vim -c NERDTree'

# Git
alias gst="git status"
alias gru="git remote update"
alias gt="git tag | sort -V"

alias gb="git status | grep 'On branch'"
alias gl="git log --graph --pretty=\"%C(green)%h%Creset %C(blue)%ae%Creset %s %C(bold blue)%ar%Creset\""

alias ebash="sudo vim ~/.bashrc"
alias evim="sudo vim /etc/vimrc"

alias ut="phpunit -c app vendor/imc"
alias lut="./vendor/bin/phpunit --coverage-text --colors tests"

# Set timezone to EST
export TZ=America/New_York

# Set vim as default editor
export EDITOR=vim

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

# [2011-05-13 17:05 EDT][tom@tom-laptop my.environment]$
STARTBLUE='\e[0;34m';
ENDBLUE="\e[0m"
STARTGREEN='\e[0;32m';
ENDGREEN="\e[0m"
# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
#export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"
#export PS1="[\$(date '+%Y-%M-%d %H:%M %Z')][$STARTGREEN\u$ENDGREEN@$STARTBLUE\h$ENDBLUE \W]\$ "
export PS1="[\
$FGRN\$(date '+%Y-%m-%d %H:%M%Z')$RS \
$FGRN\u$RS@\[\033[34m\]\h\[\033[0m\] \
$FGRN\W$RS\[\033[34m\]\
\$(parse_git_branch)\[\033[0m\]]\
\$ "

# For executing commands like Symfony's console
export PATH=$PATH:./bin
