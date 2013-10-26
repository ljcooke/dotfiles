dotfiles
========

Initial setup
-------------

    git submodule init
    git submodule update

Update modules
--------------

    git pull --recurse-submodules
    git submodule update --recursive
    git submodule foreach 'git checkout master && git pull'
    git submodule status

Copy files to home folder
-------------------------

    rsync -FLOhavc home/ $HOME/ [--dry-run]
