# tmux

## Install

### macOS

```sh
brew install tmux reattach-to-user-namespace
```

## Configure

 1. Copy the `local.tmux.conf` template file to `~/.tmux.conf`:

    ```sh
    [ ! -e $HOME/.tmux.conf ] && cp -v $HOME/.myconf/tmux/local.tmux.conf $HOME/.tmux.conf
    ```

 1. (On macOS) Edit `~/.tmux.conf` and uncomment the line containing `macos.tmux.conf`.

 1. Add machine-specific changes to `~/.tmux.conf`.

## Reload

Press <__Ctrl-S__> <__Shift-R__>.
