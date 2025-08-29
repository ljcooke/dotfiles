# -----------------------------------------------------------------------------
# Additional Bash config for BSD
# -----------------------------------------------------------------------------

# Colors for `ls`
if [ "$TERM" != "dumb" ]; then
    export CLICOLOR=1
    export LSCOLORS="ExFxCxDxBxegedabagacad"
fi

# Load the first Bash completion file from the list
# TODO: Remove the /usr/local lines if not needed. These are just left over
# from platform-independent code targeting Homebrew on macOS
for f in
    /usr/local/etc/profile.d/bash_completion.sh \
    /usr/local/etc/bash_completion \
    /etc/bash_completion
do
    if [ -r "$f" ]; then
        source "$f"
        break
    fi
done
