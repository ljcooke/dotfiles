# macOS

## See also

- [Divvy](divvy.md)
- [Hidden settings](config.sh)

## Install

### Configuration

See [defaults.md](defaults.md).

### Xcode tools

Install Xcode's Command Line Tools (CLT):

```sh
xcode-select --install
```

Later, if you run into errors like "unable to find utility 'clang'", you might have an old version of Xcode installed. Delete/upgrade it and try again.

### Homebrew

Install [Homebrew](https://brew.sh).

Run `brew bundle install` from this directory
to install the software listed in [Brewfile](Brewfile).

Run `brew doctor` to diagnose problems with the Homebrew environment.

### Set shell to Bash 5

 1. Install Bash with Homebrew:

    ```sh
    brew install bash bash-completion@2
    ```

 2. Add Homebrew's Bash build to the list of available shells.
    To do this, run `sudo vim /etc/shells` and append the following line:

    ```
    /usr/local/bin/bash
    ```

 3. Change the shell:

    ```sh
    chsh -s /usr/local/bin/bash
    ```

 4. Restart the terminal session.
