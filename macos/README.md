# macOS

## Install dependencies

Install Xcode's Command Line Tools (CLT):

```sh
xcode-select --install
```

Install [Homebrew](https://brew.sh).

Install more software using Homebrew:

```sh
brew bundle install
```

## Divvy

<img src="images/divvy-settings-1.png" width="381"><img src="images/divvy-settings-2.png" width="381"><img src="images/divvy-settings-3.png" width="381">

---

## Unmaintained

### Safari

See the [Safari](Safari.md) document.

### Terminal

`Inky Grey.terminal` is a dark theme for the native Terminal app.

Open this file to install it in Terminal. Afterwards, open the Preferences
window, select the theme in the Profiles tab, and select Default.

### Xcode

`base16-eighties.dark.dvtcolortheme` is a variant of an Xcode theme from
[joedynamite/base16-xcode](https://github.com/joedynamite/base16-xcode) on
GitHub, modified to use the Source Code Pro font.

To install the theme, run the following command which will copy the theme file
to the appropriate directory:

```sh
cp ./*.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes
```

Restart Xcode. The theme should now be available in the Preferences window on
the 'Fonts & Colors' tab.
