dotfiles
========

An accretion of config files.

For Vim configuration, see [araile/my-vim](https://github.com/araile/my-vim).

## Install

Run the following commands:

    make init

    ln -s "$PWD"/bash "$HOME"/.bash
    ln -s .bash/bashrc "$HOME"/.bashrc
    ln -s .bash/inputrc "$HOME"/.inputrc
    ln -s .bash/login "$HOME"/.bash_login

You can store additional bash configuration in `~/.bashrc.local`. This file
will be sourced by `~/.bash/bashrc`.
