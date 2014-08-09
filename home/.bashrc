[ -z "$PS1" ] && return  # return if not running interactively

source /etc/profile >/dev/null

set -o emacs  # input style
shopt -s checkwinsize  # check and update lines & cols after each cmd
shopt -s cmdhist   # multiline commands saved in history as oneliners
export EDITOR=vim
export IGNOREEOF=0  # set to 1 to ignore accidental Ctrl-D's

#
# Set the locale
#
export LC_ALL="en_IE.UTF-8"
export LC_CTYPE=$LC_ALL LC_TIME=$LC_ALL LANG=$LC_ALL

#
# Don't save history on logout
#
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE='/dev/null'

#
# Paths
#
export PYTHONPATH="$HOME/lib/python"
export PYTHONSTARTUP="$HOME/.pythonrc"

#
# Pager
#
export PAGER=less
export LESSCHARSET=utf-8
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#
# Check the OS
#
uname=$(uname)
bsd=0
mac=0
mac_homebrew=0
if [ "$uname" = Darwin ]; then
    bsd=1
    mac=1
    if [ -n "$(which brew)" ]; then
        mac_homebrew=1
    fi
elif [ "$uname" = FreeBSD ]; then
    bsd=1
fi

#
# Set the terminal title
#
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
    ;;
*)
    ;;
esac

#----------------------------------------------------------------------
#
# Fancy prompt
#
function __inky_prompt_branch()
{
    if [ -d .git ] || [ -e HEAD ]; then
        # https://gist.github.com/790086
        ref=$(git symbolic-ref -q HEAD 2> /dev/null) || return
        printf "${1:- (%s)}" "${ref#refs/heads/}"
    fi
}
function __inky_line1chars()
{
    local s[0]="╭"
    local s[1]="╮"
    local s[2]="╷"
    printf "%s%s" ${s[ $RANDOM % 3 ]} ${s[ $RANDOM % 3 ]}
}
function __inky_line2chars()
{
    local s[0]="╯"
    local s[1]="╰"
    local s[2]="╵"
    printf "%s%s" ${s[ $RANDOM % 3 ]} ${s[ $RANDOM % 3 ]}
}
function __inky_prompt_setup()
{
    # colors: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
    local RESET="\[\033[0m\]"
    local BROWN="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"

    case "$TERM" in
    dumb|vt100)
        c0=''; c_user=''; c_pwd=''; c_git=''; c_prompt=''
        ;;
    *)
        c0="$RESET"
        c_user="$BROWN"
        c_pwd="$CYAN"
        c_git="$RESET"
        c_prompt="$BROWN"
        ;;
    esac

    local line0="\[\033]0;\W\007\]\n"
    local line1="${c_user}\u@\h${c0} ${c_pwd}\w${c_git}\$(__inky_prompt_branch)"
    local line2="${c_prompt}\$"
    local lfill=""

    local UTF8=$(echo $LANG | grep UTF-8)
    if [ -n "$UTF8" ]; then
        line1="${c0}\$(__inky_line1chars) $line1"
        line2="${c0}\$(__inky_line2chars) $line2"
        lfill="   "
    fi

    PS1="${line0}${line1}${c0}\n${line2}${c0} "
    PS2="${lfill}${c_prompt}>${c0} "
    PS4="${lfill}${c_prompt}+${c0} "
}
__inky_prompt_setup
#----------------------------------------------------------------------

#
# ls colors
#
if [ "$TERM" != "dumb" ]; then
    if [ "$bsd" -eq 1 ]; then
        export CLICOLOR=1
        export LSCOLORS="ExFxCxDxBxegedabagacad"  # legible colours
    else
        if [ -n "`which dircolors`" ]; then
            eval "`dircolors -b`" 2>/dev/null
            alias ls='ls --color=auto' 2>/dev/null
        fi
    fi
fi

#
# Shortcuts
#
alias l='ls -Fhl'
alias la='ls -AF'
alias lc='ls -F'
alias ll='ls -AFhl'
alias s='screen -DRA && stty sane && echo'

#
# `.. 3` -> cd ../../..
#
function .. ()
{
    local newdir="$PWD"
    local arg=${1:-1}
    while [ $arg -gt 0 ]; do
        newdir="$newdir/.."
        arg=$(($arg - 1))
    done
    cd "$newdir"
}

#
# Create one or more directories and cd to the first one
#
function mkcd()
{
    [ -n "$1" ] && mkdir -p "$@" && cd "$1"
}

#
# Calculator
#
function calc()
{
    [ -z "$@" ] && bc -ql || echo "$@" | bc -l
}

#----------------------------------------------------------------------
#
# Open man pages in vim and Preview
#
function vman() {
    MANWIDTH=100 MANPAGER='col -bx' man $@ | vim -
}

if [ $mac -eq 1 ]; then
    function pman()
    {
        man -t $* | ps2pdf - - | open -f -a /Applications/Preview.app
    }
fi
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#
# rsync shortcut for backing up or mirroring files.
#
# 'cpr src/ dest/' will copy files from src to dest. Note the trailing
# slash after src -- if this is omitted, the command will look for or
# create a folder in dest named after src, and copy to that instead.
#
# Replace 'cpr' with 'scpr' when transferring between servers.
# To run with low priority, prepend 'n' to the command.
#
cpr="rsync -Phavz --modify-window=1 \
        --exclude '*.swp' --exclude '.DS_Store' \
        --exclude '.Trashes' --exclude '.fseventsd'"
scpr="$cpr -e 'ssh -4 -xac blowfish-cbc'"

if [ $mac -eq 1 ]; then
    if [ -n "$(rsync --version 2>/dev/null | grep xattrs)" ]; then
        cpr="$cpr --xattrs"
    fi
fi

alias cpr="$cpr" ncpr="nice -n20 $cpr"
alias scpr="$scpr" nscpr="nice -n20 $scpr"

unset cpr scpr
#----------------------------------------------------------------------

#
# ZFS
#
alias zlist='zfs list -t filesystem'
alias zim='zpool import' zex='zpool export'
function zshot()
{
    if [ -n "$1" ]; then
        zfs snapshot "$1@`date +%Y-%m-%d-%H%M`"
    else
        zfs list -t snapshot
    fi
}

#
# Bash completion
#
for f in /usr/local/etc/bash_completion /etc/bash_completion "$HOME/.bash/bash_completion"
do
    if [ -e "$f" ]; then
        source "$f"
        break
    fi
done
type -t __git_complete >/dev/null || source "$HOME/.bash/gitcomplete"

#
# Read machine-specific settings from ~/.bashrc.local
#
if [ -e "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi

#
# Tidy up
#
unset uname bsd mac mac_homebrew
