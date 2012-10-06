#!/bin/sh

# Disable the dashboard
defaults write com.apple.dashboard mcx-disabled -bool YES
killall Dashboard || true

# 2D dock style
defaults write com.apple.dock no-glass -bool YES

# Semitransparent dock icons for hidden apps
defaults write com.apple.dock showhidden -bool YES

# Turn off some crap in iTunes
defaults write com.apple.iTunes show-store-arrow-links -bool NO
defaults write com.apple.iTunes hide-ping-dropdown -bool YES

# Turn off Spaces animation
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES

# Show hidden files/folders
chflags nohidden ~/Library

# Fix the unicode bug in QuickLook. http://mths.be/bbo
# via https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# (Note: the :2 seems to correspond to British English in the Languages & Text
#  preferences. Use :0 for American English.)
echo '0x08000100:2' > ~/.CFUserTextEncoding
