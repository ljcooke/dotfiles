[ -z "$PS1" ] && return  # return if not running interactively
shopt -s checkwinsize  # check and update lines & cols after each cmd
shopt -s cmdhist   # multiline commands saved in history as oneliners
export EDITOR=vim
export IGNOREEOF=1
export HISTFILE='/dev/null' HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE='&:l:l[sla]:c[dl]:[bf]g:exit:logout:#'
export LC_ALL=en_IE.UTF-8 LC_CTYPE=en_IE.UTF-8
export LESSCHARSET=utf-8
export PYTHONPATH="$HOME/lib/python" PYTHONSTARTUP="$HOME/.pythonrc.py"
set -o emacs

# pager colours
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# terminal title
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
    ;;
*)
    ;;
esac

# git branch (slightly modified version of http://gist.github.com/5129)
gitbranch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# prompt
bash_prompt() {
    c0="\[\033[0m\]"        # reset
    c1="\[\033[1;30;40m\]"  # grey on black
    c2="\[\033[0;40m\]"     # white on black
    info="${c1}\u@\h:${c2}\w${c1}\$(gitbranch)\n"
    echo "${info}${c1}${lvl}\$ ${c0}"
}
PS1="`bash_prompt`"

# tab completion
[ -e /etc/bash_completion ] && . /etc/bash_completion

# ls colours
if [ "$TERM" != "dumb" ]; then
    [ -n "`which dircolors`" ] && eval "`dircolors -b`" 2>/dev/null
    alias ls='ls --color=auto' 2>/dev/null
fi

# shortcuts
alias ..='cd ..'
alias :q='exit' :wq='exit'  # really wish I didn't need these
alias d='dict'
alias fo='kill -9' foad='killall -9'
alias l='ls -Fhlv' la='ls -AFv' ll='ls -AFhlv'
alias lc='ls -Fv --color=auto'
alias m='mutt -y'
alias s='screen -DRA && stty sane && echo'
alias v='vim'
function mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

# git
alias gb='git branch' gba='git branch -a'
alias gc='git commit -v' gca='git commit -a'
alias gd='git diff'
alias gl='git pull'
alias glog='git log --stat'
alias gp='git push'
alias gst='git status'

# zfs
function zshot() { [ -n "$1" ] \
    && zfs snapshot "$1@`date +%Y-%m-%d-%H%M`" \
    || zfs list -t snapshot; }
alias zlist='zfs list -t filesystem'
alias zim='zpool import' zex='zpool export'

# partial download
alias scpr="rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"
alias nscpr="nice -n19 rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"

# misc
alias calc='python -ic "from math import *; from random import *"'

# local settings
local="$HOME/.bashrc.local"
[ -e "$local" ] && . "$local"
