alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cd..='cd ..'
alias df='df -h'
alias du1='du -h --max-depth=1'
alias sftp='rlwrap sftp'
alias l='ls'
alias g='grep'
alias m='less'
alias c='clear'

PATH=$PATH:$HOME/bin:/usr/local/mysql/bin:/usr/texbin

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
source ~/.git-prompt.sh

GRAY="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
ORANGE="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[1;35m\]"
VIOLET="\[\033[1;35m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[1;37m\]"
DEFAULT="\[\033[0;39m\]"
PS1="$DEFAULT[$BLUE\u$DEFAULT@$GREEN\h$DEFAULT \W]$YELLOW\$(__git_ps1)$DEFAULT\$ "

# Set screen window title
case "$TERM" in
screen)
  PROMPT_COMMAND='echo -ne "\033k\033\\"'
  ;;
screen-256color)
  PROMPT_COMMAND='echo -ne "\033k\033\\"'
  ;;
esac

export PATH
export EDITOR=vim
#colored less man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

set -o vi

# for github
#export SSH_AUTH_SOCK=0

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

if [ -f /usr/share/cdargs/cdargs-bash.sh ]; then
    . /usr/share/cdargs/cdargs-bash.sh
fi

if [ -f .dir_colors ]; then
    . .dir_colors
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
