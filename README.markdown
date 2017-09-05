dotfiles
========

An accretion of config files.

Update submodules
-----------------

    git submodule update --init --recursive

Copy files to home folder
-------------------------

    mkdir -p $HOME/.vim

    rsync [--dry-run] -FLOhavc home/ $HOME/
    rsync [--dry-run] -FLOhavc vim/ $HOME/.vim/
