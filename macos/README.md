# macOS

## See also

- [Divvy](divvy.md)
- [Hidden settings](config.sh)

## Install

### Xcode tools

Install Xcode's Command Line Tools (CLT):

```sh
xcode-select --install
```

Later, if you run into errors like "unable to find utility 'clang'", you might have an old version of Xcode installed. Delete/upgrade it and try again.

### Homebrew

Install [Homebrew](https://brew.sh).

Use `brew bundle` to install the software listed in [Brewfile](Brewfile):

```sh
brew bundle install
```

Diagnose problems with the Homebrew environment:

```sh
brew doctor
```

### Set shell to Bash 5

Install Bash with Homebrew:

```sh
brew install bash bash-completion@2
```

Add Homebrew's Bash build to the list of available shells:

```sh
sudo vim /etc/shells
# append: /usr/local/bin/bash
```

Change the shell:

```sh
chsh -s /usr/local/bin/bash
```

Then restart the terminal session.
