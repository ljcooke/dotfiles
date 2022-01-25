# -----------------------------------------------------------------------------
# Additional Bash config for macOS
# -----------------------------------------------------------------------------

source $HOME/.bash/platform/bsd.bash

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1

export COCOAPODS_DISABLE_STATS=true

export HOMEBREW_EDITOR='gvim --nofork'
export HOMEBREW_INSTALL_BADGE=💾
export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_AUTO_UPDATE=1
# export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

export PATH="$PATH:$HOME/.myconf/macos/bin"

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
