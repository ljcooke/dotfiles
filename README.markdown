dotfiles
========

An accretion of config files.

**Note**:
Vim configuration is now managed separately at
https://github.com/araile/my-vim

Update submodules
-----------------

    git submodule update --init --recursive [--remote]

Copy files to home folder
-------------------------

    mkdir -p $HOME/.vim

    rsync [--dry-run] -FLOhavc home/ $HOME/
