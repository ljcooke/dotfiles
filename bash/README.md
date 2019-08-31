# Bash

## Install

 1. Create a symlink to the `bash` directory:

    ```sh
    ln -s .myconf/bash $HOME/.bash
    ```

 1. Copy the template files to `~/.bashrc` and `~/.bash_profile` if they don't exist:

    ```sh
    [ ! -e $HOME/.bashrc ] && cp -v $HOME/.bash/bashrc.local $HOME/.bashrc
    [ ! -e $HOME/.bash_profile ] && cp -v $HOME/.bash/bash_profile.local $HOME/.bash_profile
    ```

 1. Add machine-specific changes to `~/.bashrc`.
    (See [examples](local_examples.bash).)

## Reload

```sh
exec bash -l
```
