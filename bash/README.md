# Bash

## Install

 1. Create a symlink to the `bash` directory:

    ```sh
    ln -s .myconf/bash $HOME/.bash
    ```

 1. Copy the template files to `~/.bashrc` and `~/.bash_profile` if they don't exist:

    ```sh
    [ ! -e $HOME/.bashrc ] && cp -v $HOME/.bash/bashrc.template $HOME/.bashrc
    [ ! -e $HOME/.bash_profile ] && cp -v $HOME/.bash/bash_profile.template $HOME/.bash_profile
    ```

 1. Add machine-specific changes to `~/.bashrc`.

## Reload

```sh
exec bash -l
```
