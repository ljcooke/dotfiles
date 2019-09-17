# -----------------------------------------------------------------------------
# Aliases and functions
# -----------------------------------------------------------------------------

alias h='history | tail -n $(($LINES - 4))'
alias hl='history | less'

alias l='ls -Fhl'
alias la='ls -AF'
alias lc='ls -F'
alias ll='ls -AFhl'

alias now='date "+%Y-%m-%d %H:%M:%S %Z"'
alias utc='TZ=UTC date "+%Y-%m-%d %H:%M:%S %Z"'

# Ruby
alias be='bundle exec'

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
        echo "Will save history to ${HISTFILE}"
    else
        export HISTFILE=/dev/null
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
        --exclude '*.swp' --exclude .DS_Store --exclude Thumbs.db \
        --exclude .Trashes --exclude .fseventsd"

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
  if [ -z "$1" ]; then
    tmux ls
  elif tmux has -t "$1" 2>/dev/null; then
    tmux attach -d -t "$1"
  else
    tmux new -s "$1"
  fi
}
alias s='_my_tmux_attach'

#
# Attach to a screen session
#
alias screen-attach='screen -DRA && stty sane && echo'

#
# OCR on an image in the clipboard.
# From https://mastodon.social/@aparrish/100804983641371950
#
# Prerequisites on macOS:
# brew install imagemagick pngpaste tesseract
#
alias ocr-paste1x='pngpaste - | tesseract stdin stdout'
alias ocr-paste2x='pngpaste - | convert - -resize 200% - | tesseract stdin stdout'
alias ocr-paste4x='pngpaste - | convert - -resize 400% - | tesseract stdin stdout'
