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

export PATH="$PATH:$HOME/.dotfiles/macos/bin"

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Open MacVim in the foreground without forking.
alias fvim="/usr/local/bin/mvim -f -c 'au VimLeave * !open -a Terminal'"
