# macOS

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

### Update Bash shell

Recommendation: Set your shell to a modern version of Bash using Homebrew.

- As of Oct 2026, Homebrew provides Bash 5.3 while MacOS still uses Bash 3.2 by default.

Instructions for Apple silicon:

 1. Install Bash with Homebrew:

    ```sh
    brew install bash bash-completion@2
    ```

 2. Add Homebrew's Bash build to the list of available shells.

    Run `sudo vim /etc/shells` to edit the list.
    Append the following line:

    ```
    /opt/homebrew/bin/bash
    ```

 3. Change the shell:

    ```sh
    chsh -s /opt/homebrew/bin/bash
    ```

 4. Restart the terminal session.

For Intel, replace the path with `/usr/local/bin/bash` in steps 2 and 3.
