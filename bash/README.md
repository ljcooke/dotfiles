# Bash

This directory is intended to be symlinked at `~/.bash`. You can do this by
running:

    ln -s $HOME/.dotfiles/bash $HOME/.bash
    ln -s .bash/bashrc $HOME/.bashrc
    ln -s .bash/bash_login $HOME/.bash_login

where `$HOME/.dotfiles` is the full path to this repository.

You can store additional bash configuration in `~/.bashrc.local`, which will
be sourced by `~/.bashrc`.
