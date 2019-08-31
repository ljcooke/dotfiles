# Readline

## Install

 1. Copy the `template.inputrc` file to `~/.inputrc` if it doesn't exist:

    ```sh
    [ ! -e $HOME/.inputrc ] && cp -v readline/template.inputrc $HOME/.inputrc
    ```

 1. Add machine-specific changes to `~/.inputrc`.

## Reload

```sh
bind -f ~/.inputrc
```

## Documentation

https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html
