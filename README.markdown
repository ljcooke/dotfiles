dotfiles
========

An accretion of config files.

## Install

Verify that the following do not already exist:

    ~/.inputrc
    ~/.vim
    ~/.vimrc
    ~/.gvimrc

Run the following commands:

    $ git submodule update --init --recursive

    $ bin/config-bash
    $ bin/config-git

    $ ln -s $PWD/vim  $HOME/.vim
    $ ln -s .bash/inputrc $HOME/.inputrc

You can store additional bash configuration in `~/.bashrc.local`. This file
will be sourced by `~/.bash/bashrc`.

Further configuration for macOS:

    $ bin/config-macos

## Update submodules

Run this command if you need to pull changes from the git submodules:

    git submodule update --init --recursive --remote
