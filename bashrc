# added JAVA_HOME ENV
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_45

# Added Terraform
export PATH=$PATH:/usr/terraform

# Lazy
alias today="date +%F"
alias update="sudo apt-get update && sudo apt-get upgrade"

# Elpy
export PATH=$PATH:~/.local/bin/

# Functions
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function promptline {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local       WHITE="\[\033[1;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\

$RED\u@\h:$WHITE\w$BLUE\$(parse_git_branch)\

$WHITE> "

PS2='> '
PS4='+ '
}

promptline
