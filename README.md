My Vim configuration
====================

## Install

    $ ln -s $PWD/vim $HOME/.vim

    $ git submodule update --init --recursive

## Add a package

    $ git submodule add \
          --name <foo> \
          <url> \
          vim/pack/modules/start/<foo>
