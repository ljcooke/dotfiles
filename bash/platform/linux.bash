# -----------------------------------------------------------------------------
# Additional Bash config for Linux
# -----------------------------------------------------------------------------

# Colors for `ls`
if [ "$TERM" != "dumb" ]; then
    if [ -n "`which dircolors`" ]; then
        eval "`dircolors -b`" 2>/dev/null
        alias ls='ls --color=auto' 2>/dev/null
    fi
fi
