dotfiles
========

An accretion of config files.

## Install

Verify that the following do not already exist:

    ~/.bash
    ~/.inputrc
    ~/.vim
    ~/.vimrc
    ~/.gvimrc

Run the following commands:

    $ git submodule update --init --recursive

    $ ln -s $PWD/bash $HOME/.bash
    $ ln -s $PWD/vim  $HOME/.vim
    $ ln -s .bash/inputrc $HOME/.inputrc

Add the following to `~/.bash_profile`:

    if [ -f ~/.bash/bashrc ]; then source ~/.bash/bashrc; fi

    stty erase ^h  # set backspace character

You can store additional bash configuration in `~/.bashrc`. This file will be
sourced by `~/.bash/bashrc`.

## Update submodules

Run this command if you need to pull changes from the git submodules:

    git submodule update --init --recursive --remote
