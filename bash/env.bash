# Backspace character
stty erase ^h

# Input style
set -o emacs

# Default editor
export EDITOR=vim

# Check and update lines & cols after each command
shopt -s checkwinsize

# Set to 1 to ignore accidental Ctrl-D's
export IGNOREEOF=0

# Locale (run `locale -a` to see what is available)
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE=$LC_ALL LC_TIME=$LC_ALL LANG=$LC_ALL

# History
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE=$HOME/.bash_history
export HISTSIZE=10000 HISTFILESIZE=10000
export HISTIGNORE=history:h:hl:ls:l:la:lc:ll:fg
export HISTTIMEFORMAT='%F %T '
shopt -s cmdhist
shopt -s histappend

# Pager
export PAGER=less
export LESSCHARSET=utf-8

# Python
export PYTHONPATH="$HOME/lib/python"
export PYTHONSTARTUP="$HOME/.pythonrc"
