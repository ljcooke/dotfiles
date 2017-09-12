# Vim

## Install

    $ git submodule update --init --recursive
    $ ln -s $PWD $HOME/.vim
    $ make doc

## Update submodules

    $ git submodule update --init --recursive --remote
    $ make doc

## Add a submodule

    $ git submodule add --name <foo> <url> vim/pack/modules/start/<foo>
    $ make doc
