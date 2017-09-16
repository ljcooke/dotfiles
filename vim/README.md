# Vim

## Plugin management

Plugins are stored in the `vim/bundle` directory. This is symlinked from
`vim/pack/bundle/start` so that they are loaded using the native *package*
feature in Vim 8.

To add a plugin named `foo` that is maintained in a git repository, add an
entry to the `vim/bundle/SOURCES.yaml` file and commit it. Then run:

    $ bin/vim-plugin-update foo

This will commit the new plugin to this repo. Run the same command later to
update the plugin.
