# My configuration

An accretion of configuration files.



## Bash

### Install

    ln -s $PWD/bash $HOME/.bash
    ln -s .bash/bashrc $HOME/.bashrc
    ln -s .bash/bash_login $HOME/.bash_login

You can store additional bash configuration in `~/.bashrc.local`, which will
be sourced by `~/.bashrc`.



## Vim

### Install

Run:

    ln -s $PWD/vim $HOME/.vim

### Plugin management

Plugins are stored in the `vim/bundle` directory, which is symlinked from
`vim/pack/bundle/start`. These are loaded natively in Vim 8 (using the
*packages* feature); Pathogen is used as a fallback in Vim 7.

Plugins that are available via git can be managed using the `git-subtree`
feature. There is a script to make this easy to use. To add a new plugin named
`foo`:

  - Add an entry with the git URL to the `vim/bundle/SOURCES.yaml` file.
    Commit any changes before the next step.

  - Run:

        $ bin/vim-plugin-update foo

    This will fetch the git repository, squash the commits, and merge them into
    the `vim/bundle/<foo>` directory.

Repeat the second step above to merge in any new changes to the repository.
