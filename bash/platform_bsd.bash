# -----------------------------------------------------------------------------
# Additional Bash config for BSD
# -----------------------------------------------------------------------------

# Colors for `ls`
if [ "$TERM" != "dumb" ]; then
    export CLICOLOR=1
    export LSCOLORS="ExFxCxDxBxegedabagacad"
fi
