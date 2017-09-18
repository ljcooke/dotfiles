# My configuration

An accretion of configuration files.

    $ git clone https://github.com/araile/dotfiles.git ~/.dotfiles



## Bash

### Setup

    $ ln -s .dotfiles/bash $HOME/.bash
    $ ln -s .bash/bashrc $HOME/.bashrc
    $ ln -s .bash/bash_login $HOME/.bash_login

You can store additional bash configuration in `~/.bashrc.local`, which will
be sourced by `~/.bashrc`.



## Vim

### Setup

    $ ln -s .dotfiles/vim $HOME/.vim
    $ maintenance/vim-help-update

### Plugin management

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
