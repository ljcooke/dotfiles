# Readline configuration

## Install

Copy the `template.inputrc` file to `~/.inputrc` if it doesn't exist:

```sh
test ! -e $HOME/.inputrc && cp -v readline/template.inputrc $HOME/.inputrc
```

Add machine-specific changes to this `~/.inputrc` file.

## Reload

```sh
bind -f ~/.inputrc
```

## Documentation

https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html
