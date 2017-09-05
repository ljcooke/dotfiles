My Vim configuration
====================

## Install

    $ ln -s $PWD/vim $HOME/.vim

## Working with submodules

To update all submodules:

    $ git submodule update --init --recursive

To add a new submodule:

    $ git submodule add \
          --name <foo> \
          <url> \
          vim/pack/<category>/start/<foo>
