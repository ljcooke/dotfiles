[ -z "$PS1" ] && return  # return if not running interactively
shopt -s checkwinsize    # check and update lines & cols after each cmd
shopt -s cmdhist  # multiline commands saved in history as oneliners
shopt -s histappend
export EDITOR=vim
export HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE='&:l:l[sla]:c[dl]:[bf]g:exit:logout:#'
export HISTSIZE=1000
export LC_ALL=en_IE.UTF-8 LC_CTYPE=en_IE.UTF-8
export LESSCHARSET=utf-8
export PYTHONPATH=$HOME/lib/python
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
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"' ;;
*)
    ;;
esac

# prompt
c0="\[\033[0m\]"
c1="\[\033[1;40m\]"
export PS1="$c1\u@\h:\w\n$c1\$$c0 "

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

# simple encryption
function blow()
{
    [ -z "$1" ] && echo 'Encrypt: blow FILE' && return 1
    openssl bf-cbc -salt -in "$1" -out "$1.bf"
}
function fish()
{
    test -z "$1" -o -z "$2" && echo \
        'Decrypt: fish INFILE OUTFILE' && return 1
    openssl bf-cbc -d -salt -in "$1" -out "$2"
}

# processes
function p_cpu()
{
    ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu \
        | sed '/^ 0.0 /d' | pr -TW$COLUMNS
}
function p_mem()
{
    ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS
}
function p_user() { ps aux | grep "^$USER" | pr -TW$COLUMNS; }
alias p='p_user'

# zfs
function zshot() { [ -n "$1" ] \
    && zfs snapshot "$1@`date +%Y-%m-%d-%H%M`" \
    || zfs list -t snapshot; }
alias zlist='zfs list -t filesystem'
alias zim='zpool import' zex='zpool export'

# partial download
alias scpr="rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"
alias nscpr="nice -n19 rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"

# other useful commands
alias calc='python -ic "from math import *; from random import *"'
alias pwds='pwds -Bcn 11'

# local settings
[ -e $HOME/.inkyrc ] && . $HOME/.inkyrc
