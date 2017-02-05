###############
# Keybindings #
###############
alias today="date +%F"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias c="curl"
alias f="find"
alias g="git"
alias gb="git branch"
alias gbv="git branch -v"
alias gco="git checkout"
alias gst="git status"
alias l="ls"
alias la="ls -a"
alias lh="ls -lh"
alias ll="ls -l"
alias r="rgrep"

#########
# Emacs #
#########
export ALTERNATE_EDITOR=emacs EDITOR="emacsclient -t" VISUAL="emacsclient -c -n"
alias ed="emacs --daemon"
alias et="emacsclient -t"
alias ec="emacsclient -c -n -a emacs"
alias ek="emacsclient -e '(kill-emacs)'"

############
# Terminal #
############
export TERM=xterm-256color

########
# Tmux #
########
alias t="tmux"
alias tk="tmux kill-ses -t"
alias tka="tmux kill-session -a"

########
# Java #
########
# added JAVA_HOME ENV
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre
# export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_45
export JAVACMD='which java'
export PATH=$PATH:~/kyleschmidt/appengine-java-sdk-1.9.48/bin/


###########
# Clojure #
###########
# Leiningen
export PATH=$PATH/bin/lein

##########
# Kepler #
##########
# Openvpn
alias kvpn="sudo openvpn --config /home/kyleschmidt/kyleschmidt.conf"

# Activate Virtualenv
alias svba="source venv/bin/activate"


########################
# Format Bash Prompt   #
########################

# Colors
BBLACK="\033[1;30m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
PURPLE="\033[1;35m"
ORANGE="\033[38;5;202m"
BLUE="\033[34;5;115m"
WHITE="\033[0;37m"
BWHITE="\033[1;37m"
BCYAN="\033[1;36m"
COLOR_RESET="\033[0m"
BOLD="$(tput bold)"

# LS COLORS
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

# Functions
function git_color {
  local git_status="$(git status 2> /dev/null)"
  local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  local git_commit="$(git --no-pager diff --stat origin/${branch} 2>/dev/null)"
  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]] && \
      [[ ! -n $git_commit ]]; then
    echo -e $GREEN
  else
    echo -e $ORANGE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1_DIR="\

\[$BCYAN\]\u@\h: \[$BLUE\]\w "

PS1_GIT="\[\$(git_color)\]\[$BOLD\]\$(git_branch)\[$BOLD\]\[$COLOR_RESET\]"

PS1_END="\

\[$ORANGE\]$ "

PS1="${PS1_DIR}${PS1_GIT}${PS1_END}"


#######################################################################
# Detect current git branch
#######################################################################
function git_branch_no_paren {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "$branch"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "$commit"
  else
    echo "no_git"
  fi
}

export GITBRANCH=$(git_branch_no_paren)
