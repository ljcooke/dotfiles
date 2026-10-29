# -----------------------------------------------------------------------------
# Additional Bash config for macOS
# -----------------------------------------------------------------------------

# Colors for `ls`
if [ "$TERM" != "dumb" ]; then
    export CLICOLOR=1
    export LSCOLORS="ExFxCxDxBxegedabagacad"
fi

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1

export COCOAPODS_DISABLE_STATS=true

# See the Homebrew FAQ: "Why is the default installation prefix
# /opt/homebrew on Apple Silicon?"
if [ -z "${HOMEBREW_PREFIX:-}" ] && [ -d /opt/homebrew ]; then
    export HOMEBREW_PREFIX=/opt/homebrew
fi

export HOMEBREW_EDITOR='gvim --nofork'
export HOMEBREW_INSTALL_BADGE=💾
export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_AUTO_UPDATE=1
# export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

export PATH="$PATH:$HOME/.local/opt/dotljc/macos/bin"

# -----------------------------------------------------------------------------
# Bash completion
# -----------------------------------------------------------------------------

# Load the first Bash completion file from the list
for f in \
    ${HOMEBREW_PREFIX:-/usr/local}/etc/profile.d/bash_completion.sh \
    ${HOMEBREW_PREFIX:-/usr/local}/etc/bash_completion \
    /etc/bash_completion
do
    if [ -r "$f" ]; then
        source "$f"
        break
    fi
done

# -----------------------------------------------------------------------------
# Aliases & functions
# -----------------------------------------------------------------------------

alias ll='ls -AFhl -O'

# cd to the top-most Finder window location
# Originally from https://github.com/mathiasbynens/dotfiles
cdfinder() {
    cd "$(osascript -e \
        'tell app "Finder" to POSIX path of (insertion location as alias)')"
}
