dotfiles
========

An accretion of config files.

Copy files to home folder
-------------------------

    mkdir -p $HOME/.vim

    rsync [--dry-run] -FLOhavc home/ $HOME/
    rsync [--dry-run] -FLOhavc vim/ $HOME/.vim/
