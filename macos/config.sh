#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# macOS config script
#
# References:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# -----------------------------------------------------------------------------

set -o errexit
set -o nounset
set -o xtrace

# Exit silently if not running on macOS
if [ "$(uname -s)" != Darwin ]; then
    exit 0
fi

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change.
osascript -e 'tell application "System Preferences" to quit'

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------

if ! which brew; then
    echo 'Install Homebrew: https://brew.sh'
    exit 1
fi

set -o xtrace

brew bundle install

# -----------------------------------------------------------------------------
# Dashboard
# -----------------------------------------------------------------------------

# Disable the dashboard
defaults write com.apple.dashboard mcx-disabled -bool YES

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

# Hide desktop icons
defaults write com.apple.finder CreateDesktop -bool NO

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
# MacVim
# -----------------------------------------------------------------------------

# Allow zooming horizontally as well as vertically
defaults write org.vim.MacVim MMZoomBoth 1

# Disable checking for software updates (let homebrew handle it)
defaults write org.vim.MacVim SUEnableAutomaticChecks 0

# -----------------------------------------------------------------------------
# Mail
# -----------------------------------------------------------------------------

# Copy email addresses as 'foo@bar.com' instead of 'Foo Bar <foo@bar.com>'
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool NO

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
# Terminal
# -----------------------------------------------------------------------------

# Enable 'Secure Keyboard Entry'
defaults write com.apple.terminal SecureKeyboardEntry -bool YES

# Disable line marks
defaults write com.apple.Terminal ShowLineMarks -bool NO

# -----------------------------------------------------------------------------
# Time Machine
# -----------------------------------------------------------------------------

# Don't ask to use a new hard drive for backups
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

# -----------------------------------------------------------------------------
# Misc Configuration
# -----------------------------------------------------------------------------

# Disable creating .DS_Store files in some places
# See: https://github.com/mathiasbynens/dotfiles/issues/635
defaults write com.apple.desktopservices DSDontWriteNetworkStores 'true'
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool YES

# Don't use iCloud as the default location for saving files
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool NO

# Disable window animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool NO
defaults write -g NSWindowResizeTime -float 0.001

# Use the dark menu bar
defaults write -g AppleInterfaceStyle -string Dark

for app in Dashboard Dock Finder
do
    killall $app || true
done
