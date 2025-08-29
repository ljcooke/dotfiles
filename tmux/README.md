# tmux

## Install

### macOS

```sh
brew install tmux

# This step no longer seems necessary:
# brew install reattach-to-user-namespace
```

## Configure

 1. Run `./setup.sh` to copy the config file template to
    `~/.config/tmux/tmux.conf`.

 1. On macOS only, edit `~/.config/tmux/tmux.conf`
    and uncomment the line containing `macos.tmux.conf`.

 1. Add machine-specific changes to `~/.config/tmux/tmux.conf`.

## Reload

Press <__Ctrl-S__> <__Shift-R__>.
