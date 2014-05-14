dotfiles
========

Initial setup
-------------

    git submodule init
    git submodule update

Update modules
--------------

    bin/update.sh

Copy files to home folder
-------------------------

    rsync -FLOhavc home/ $HOME/ [--dry-run]
