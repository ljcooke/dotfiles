#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

# Exit silently if not running on macOS
if [ "$(uname -s)" != Darwin ]
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

set -o xtrace

brew bundle install

# -----------------------------------------------------------------------------
# Dock
# -----------------------------------------------------------------------------

# Don't animate the icon when launching an app
defaults write com.apple.dock launchanim -bool NO

# Fade out hidden app icons
defaults write com.apple.dock showhidden -bool YES

# -----------------------------------------------------------------------------
# Finder
# -----------------------------------------------------------------------------

# Reveal the Library folder
chflags nohidden ~/Library

# Show the path bar
defaults write com.apple.finder ShowPathbar -bool YES

# 'General' Preferences tab
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool YES
defaults write com.apple.finder ShowMountedServersOnDesktop -bool YES
defaults write com.apple.finder FinderSpawnTab -bool YES

# 'Advanced' Preferences tab
defaults write com.apple.finder AppleShowAllExtensions -bool YES
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool NO
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool YES
defaults write com.apple.finder FXRemoveOldTrashItems -bool YES
defaults write com.apple.finder _FXSortFoldersFirst -bool NO

# -----------------------------------------------------------------------------
# Safari
# -----------------------------------------------------------------------------

# 'General' Preferences tab
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 7
defaults write com.apple.Safari AlwaysPromptForDownloadFolder -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool NO

# 'Privacy' Preferences tab
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool YES

# 'Advanced' Preferences tab
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool YES
defaults write com.apple.Safari IncludeDevelopMenu -bool YES

# -----------------------------------------------------------------------------
# MacVim
# -----------------------------------------------------------------------------

defaults write org.vim.MacVim MMZoomBoth 1

# -----------------------------------------------------------------------------
# Misc Configuration
# -----------------------------------------------------------------------------

# Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Use the dark menu bar
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark

# Disable the dashboard
defaults write com.apple.dashboard mcx-disabled -bool YES

killall Dashboard || true
killall Dock || true
