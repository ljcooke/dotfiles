# Readline

## Install

 1. Copy the template file to `~/.inputrc` if it doesn't exist:

    ```sh
    [ ! -e $HOME/.inputrc ] && cp -v readline/inputrc.local $HOME/.inputrc
    ```

 1. Add machine-specific changes to `~/.inputrc`.
    (See [examples](local_examples).)

## Reload

```sh
bind -f ~/.inputrc
```

## Documentation

https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html
