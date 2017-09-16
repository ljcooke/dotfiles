# Vim

## Plugin management

Plugins are stored in the `vim/bundle` directory. This is symlinked from
`vim/pack/bundle/start` so that they are loaded using the native *package*
feature in Vim 8.

To add a plugin named `foo` that is maintained in a git repository, run:

    $ git subtree add --prefix vim/bundle/foo <url> master --squash

This will commit the new plugin to this repo in such a way that it can be
updated later using git.

Afterwards, add an appropriate entry to the `vim/bundle/SOURCES.yaml` file.

Later, you can update the plugin by running:

    $ bin/vim-plugin-update foo
