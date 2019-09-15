# Vim

## Install

### macOS

```sh
brew install vim
brew cask install macvim
```

## Configure

 1. Create a symlink to the `vim` directory
    (this can be run from any directory):

    ```sh
    ln -s .myconf/vim $HOME/.vim
    ```

 1. Generate a `doc/tags` file for each Vim plugin that has a `doc` directory:

    ```sh
    vim -c ':call pathogen#helptags()' +qall
    find vim/bundle -type f -name tags
    ```

    This enables us to read the documentation using the `:help` command.

## Plugins

Plugins are installed in the [`bundle`](bundle/) directory and symlinked from
`pack/bundle/start`, so they will load automatically in Vim 7 (using Pathogen)
and Vim 8 (as native plugins).

Plugins are generally managed as [Git submodules](../.gitmodules), and named
with a category prefix (because I could never remember what each plugin was
for).

| Prefix | Description |
|--------|-------------|
| `edit` | Text editing. |
| `ft`   | File types. |
| `ui`   | User interface. |
| `util` | Utilities. |

### Dependencies

- [ft-org](bundle/ft-org) depends on
  [util-speeddating](bundle/util-speeddating).
