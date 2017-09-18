# Backspace character
stty erase ^h

# Input style
set -o emacs

# Default editor
export EDITOR=vim

# Set to 1 to ignore accidental Ctrl-D's
export IGNOREEOF=0

# Locale (run `locale -a` to see what is available)
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE=$LC_ALL LC_TIME=$LC_ALL LANG=$LC_ALL

# History
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE=$HOME/.bash_history
export HISTSIZE=20000 HISTFILESIZE=20000
export HISTIGNORE=history:h:hl:ls:l:la:lc:ll:fg
export HISTTIMEFORMAT='%F %T '
shopt -s cmdhist 2>/dev/null
shopt -s histappend 2>/dev/null

# Check if any jobs are running before exiting the shell
shopt -s checkjobs 2>/dev/null

# Check and update lines & cols after each command
shopt -s checkwinsize 2>/dev/null

# Pager
export PAGER=less
export LESSCHARSET=utf-8

# Don't clear the screen after quitting `man`
export MANPAGER='less -X'

# Python
export PYTHONPATH="$HOME/lib/python"
export PYTHONSTARTUP="$HOME/.pythonrc"

# Paths
export PATH="$PATH:$HOME/.dotfiles/bin"
