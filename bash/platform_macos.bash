# -----------------------------------------------------------------------------
# Additional Bash config for macOS
# -----------------------------------------------------------------------------

source $HOME/.bash/platform_bsd.bash

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export COCOAPODS_DISABLE_STATS=true

export HOMEBREW_EDITOR='gvim --nofork'
export HOMEBREW_INSTALL_BADGE=💾
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

#
# `cd` to the top-most Finder window location
# Source: https://github.com/mathiasbynens/dotfiles
#
cdfinder() {
    cd "$(osascript -e \
        'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

#
# Open a man page in your default browser.
#
# Requires:
#   brew install man2html
#   gem install bcat
#
hman() {
    if [ $# -gt 0 ]
    then
        man "$@" | man2html | bcat
    else
        man
        return 1
    fi
}

#
# Open a man page in Preview.
#
# Requires:
#   brew install ghostscript
#
pman() {
    if [ $# -gt 0 ]
    then
        man -t "$@" | ps2pdf - - | open -f -a /Applications/Preview.app
    else
        man
        return 1
    fi
}

#
# Open MacVim in the foreground without forking.
#
alias fvim="/usr/local/bin/mvim -f -c 'au VimLeave * !open -a Terminal'"
