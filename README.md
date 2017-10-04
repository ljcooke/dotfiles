# My configuration

An accretion of configuration files.

## Install

Clone the repository into `~/.myconf`:

    $ git clone https://github.com/ljcooke/dotfiles.git ~/.myconf

Install the required fonts:

  - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/releases)
    (look for the 'Roman fonts' download)

Set up symlinks:

  - Bash:

        $ ln -s .myconf/bash $HOME/.bash
        $ ln -s .bash/bashrc $HOME/.bashrc
        $ ln -s .bash/bash_profile $HOME/.bash_profile

  - Vim:

        $ ln -s .myconf/vim $HOME/.vim
        $ maintenance/vim-help-update

Additional configuration is detailed in other documents:

  - [Git](git/README.md)

  - [macOS](macos/README.md)

  - [Sublime Text](sublime/README.md)

## Bash

Local bash settings can be stored in `~/.bashrc.local`. This file will be
sourced by `~/.bashrc`.

## Vim

Plugins are stored in the `vim/bundle` directory, which is symlinked from
`vim/pack/bundle/start`. These are loaded natively in Vim 8 (using the
*packages* feature); Pathogen is used as a fallback in Vim 7.

Plugins that are available via git can be managed using the `git-subtree`
feature. There is a script to make this easy to use. To install a new plugin
named `foo`:

 1. Add an entry with the git URL to the `SOURCES.yaml` file.
    Commit any changes before the next step.

 1. Run:

        $ maintenance/vim-plugin-update foo

    This will fetch the git repository, squash the commits, and merge them into
    the `vim/bundle/<foo>` directory.

Repeat the second step above to merge in any new changes to the repository.
