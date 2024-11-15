# Set default paths for the XDG Base Directory spec
if [ -z "${XDG_CONFIG_HOME:-}" ]; then
  export XDG_CONFIG_HOME=$HOME/.config
fi
if [ -z "${XDG_CACHE_HOME:-}" ]; then
  export XDG_CACHE_HOME=$HOME/.cache
fi
if [ -z "${XDG_DATA_HOME:-}" ]; then
  export XDG_DATA_HOME=$HOME/.local/share
fi
if [ -z "${XDG_STATE_HOME:-}" ]; then
  export XDG_STATE_HOME=$HOME/.local/state
fi

# Default editor
export EDITOR=vim

# Set to 1 to ignore accidental Ctrl-D's
export IGNOREEOF=0

# Locale (run `locale -a` to see what is available)
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE=$LC_ALL LC_TIME=$LC_ALL LANG=$LC_ALL

# History
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/bash/.bash_history
export HISTSIZE=50000 HISTFILESIZE=50000
export HISTIGNORE=history:h:hl:ls:l:la:lc:ll:fg
export HISTTIMEFORMAT='%F %T '
shopt -s cmdhist 2>/dev/null
shopt -s histappend 2>/dev/null

# Check if any jobs are running before exiting the shell
shopt -s checkjobs 2>/dev/null

# Check and update lines & cols after each command
shopt -s checkwinsize 2>/dev/null

# Case-insensitive path expansion
shopt -s nocaseglob

# Perform history expansion before inserting a space e.g. !!<space>
bind 'Space: magic-space'

# Less pager
export PAGER=less
export LESS='-FRX'
export LESSCHARSET=utf-8
# - Use XDG base dirs. Not required since v598 (2021),
#   but MacOS uses v581.2 (as of 2024).
#   https://www.greenwoodsoftware.com/less/news.598.html
export LESSHISTFILE=${XDG_STATE_HOME}/lesshst
export LESSKEY=${XDG_CONFIG_HOME}/less

# Python
# - TODO: Review PYTHONPATH and PYTHONSTARTUP
export PYTHONPATH="$HOME/lib/python"
export PYTHONSTARTUP="$HOME/.pythonrc"
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history

# Ruby
export IRBRC="$HOME/.ljc/ruby/irbrc.rb"

# Paths
export PATH="$PATH:$HOME/.ljc/bin"

# Paths to search when cd-ing to a directory.
# Colon separated, e.g. ".:~/src"
export CDPATH="."
