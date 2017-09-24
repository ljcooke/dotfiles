# -----------------------------------------------------------------------------
# Aliases and functions
# -----------------------------------------------------------------------------

alias h='history | tail -n $(($LINES - 2))'
alias hl='history | less'

alias l='ls -Fhl'
alias la='ls -AF'
alias lc='ls -F'
alias ll='ls -AFhl'

alias py2=python2
alias py3=python3

alias utc-date='TZ=UTC date +"%a %Y-%m-%d %H:%M:%S %z"'
alias utc-ymd='TZ=UTC date +"%Y-%m-%d"'

#
# Type `..` without arguments to go up one directory.
# Type `.. 2` to go up 2 directories, etc.
#
..() {
    local newdir="$PWD"
    local arg=${1:-1}
    while [ $arg -gt 0 ]; do
        newdir="$newdir/.."
        arg=$(($arg - 1))
    done
    cd "$newdir"
}

#
# Create one or more directories and `cd` to the first one.
#
mkcd() {
    [ $# -gt 0 ] && mkdir -p "$@" && cd "$1"
}

#
# Toggle whether to save the command history.
#
hist-toggle()
{
    if [ "$HISTFILE" = /dev/null ]; then
        export HISTFILE=$HOME/.bash_history
        export MY_PROMPT_PREFIX=
        export MY_PROMPT_PREFIX_COLOR=
        echo "Will save history to ${HISTFILE}"
    else
        export HISTFILE=/dev/null
        export MY_PROMPT_PREFIX=\!H
        export MY_PROMPT_PREFIX_COLOR="\[\033[31m\]"
        echo 'Will NOT save history'
    fi
}

#
# Sync files using rsync.
#
# `cpr src/ dest/` will copy files from src to dest. Note the trailing
# slash after src -- if this is omitted, the command will look for or
# create a folder in dest named after src, and copy to that instead.
#
_my_rsync() {
    local action=$1
    shift

    local args="\
        -Phavz \
        --exclude '*.swp' --exclude '.DS_Store' \
        --exclude '.Trashes' --exclude '.fseventsd'"

    case "$action" in
        local)
            local uname=`uname -s`
            if [ "$uname" = Darwin ]; then
                args="${args} --xattrs"
            fi
            ;;
        fat)
            args="${args} --modify-window=1"
            ;;
        remote)
            ;;
    esac

    echo rsync $args "$@"
    rsync $args "$@"
}
alias cpr='_my_rsync local'
alias fcpr='_my_rsync fat'
alias scpr='_my_rsync remote'

#
# Attach to a tmux session
#
_my_tmux_attach() {
    [ -n "$1" ] && session=$1 || session=main
    tmux attach-session -d -t "$session" || tmux new-session -s "$session"
}
alias s='_my_tmux_attach'

#
# Attach to a screen session
#
alias screen-attach='screen -DRA && stty sane && echo'
