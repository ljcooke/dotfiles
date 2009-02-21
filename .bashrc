[ -z "$PS1" ] && return  # return if not running interactively
source /etc/profile

set -o emacs

shopt -s checkwinsize  # check and update lines & cols after each cmd
shopt -s cmdhist   # multiline commands saved in history as oneliners

export EDITOR=vim
export IGNOREEOF=1
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE='/dev/null'
export LC_ALL=en_IE.UTF-8 LC_CTYPE=en_IE.UTF-8
export PYTHONPATH="$HOME/lib/python"
export PYTHONSTARTUP="$HOME/.pythonrc.py"

export PAGER=less
export LESSCHARSET=utf-8
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


# prompt
c0="\[\033[0m\]"        # reset
c1="\[\033[1;30;40m\]"  # grey on black
c2="\[\033[0;40m\]"     # white on black

function parse_git_branch()
{
    # http://gist.github.com/31675
    status="$(git status 2>/dev/null)"
    [[ -z ${status} ]] && return 1
    re="^# On branch ([^${IFS}]*)"
    state=""
    [[ ! ${status} =~ "working directory clean" ]] && state='*'
    if [[ ${status} =~ ${re} ]]; then
        branch=${BASH_REMATCH[1]}
        echo " [${branch}${state}]"
    fi
}

function bash_prompt()
{
    info="${c1}\u·\h ${c2}\w${c1}\$(parse_git_branch)\n"
    echo "${info}${c1}${lvl}\$ ${c0}"
}

PS1="`bash_prompt`"
PS2="$c1. $c0"


# ls colours
if [ "$TERM" != "dumb" ]; then
    [ -n "`which dircolors`" ] && eval "`dircolors -b`" 2>/dev/null
    alias ls='ls --color=auto' 2>/dev/null
fi


# shortcuts
alias ..='cd ..'
alias d='dict'
alias l='ls -Fhlv'
alias la='ls -AFv'
alias lc='ls -Fv --color=auto'
alias ll='ls -AFhlv'
alias m='mutt -y'
alias s='screen -DRA && stty sane && echo'
alias v='vim'

function mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }
function calc() { [ -z "$@" ] && bc -ql || echo "$@" | bc -l; }

# zfs
function zshot() { [ -n "$1" ] \
    && zfs snapshot "$1@`date +%Y-%m-%d-%H%M`" \
    || zfs list -t snapshot; }
alias zlist='zfs list -t filesystem'
alias zim='zpool import' zex='zpool export'

# partial download
alias scpr="rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"
alias nscpr="nice -n19 rsync --modify-window=1 -Phavze 'ssh -4 -xac blowfish-cbc'"


function _import() { [ -e "$HOME/.bash/$1" ] && source "$HOME/.bash/$1"; }

_import 'complete'
_import 'git'
_import 'gitcomplete'

# store machine-specific settings in ~/.bashrc.local
_import '../.bashrc.local'
