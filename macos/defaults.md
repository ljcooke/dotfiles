## Finder

```sh
# Hide desktop icons
defaults write com.apple.finder CreateDesktop -bool NO
```

## Screenshots

```sh
# Set the screenshot location
defaults write com.apple.screencapture location "${HOME}/Pictures/Screenshots"

# Save as .jpg instead of .png
defaults write com.apple.screencapture type JPG
```
