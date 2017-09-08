#!/usr/bin/env bash

set -o nounset

# Exit silently if not running on macOS
if [ $(uname) != Darwin ]
then
    exit 0
fi

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------

if ! which brew
then
    echo 'Install Homebrew: https://brew.sh'
    exit 1
fi

set -o errexit
set -o xtrace

brew bundle install --file=macos/Brewfile

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------

# Reveal the Library folder in Finder
chflags nohidden ~/Library

# Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO

# Fade out hidden app icons in the dock
defaults write com.apple.dock showhidden -bool YES

# Disable the dashboard
defaults write com.apple.dashboard mcx-disabled -bool YES

killall Dashboard || true
killall Dock      || true
