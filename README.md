My Vim configuration
====================

## Working with submodules

To update all submodules:

    $ git submodule update --init --recursive

To add a new submodule:

    $ git submodule add \
          --name <foo> \
          <url> \
          vim/pack/<category>/start/<foo>
