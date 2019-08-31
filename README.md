# My configuration

An accretion of configuration files.

## Install

Clone the repository into `~/.myconf`:

```sh
git clone https://github.com/ljcooke/dotfiles.git ~/.myconf
```

Install fonts:

  - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/releases)
    (look for the 'Roman fonts' download)

Set up symlinks:

```sh
ln -s .myconf/bash $HOME/.bash
ln -s .bash/bashrc $HOME/.bashrc
ln -s .bash/bash_profile $HOME/.bash_profile
```

Additional configuration is detailed in other documents:

  - [Git](git/README.md)
  - [macOS](macos/README.md)
  - [Readline](readline/README.md)
  - [Sublime Text](sublime/README.md)
  - [Vim](vim/README.md)

## Bash

Local bash settings can be stored in `~/.bashrc.before` and `~/.bashrc.after`.
These files will be sourced by `~/.bashrc` if they exist.
