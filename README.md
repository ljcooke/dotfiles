# My configuration

An accretion of configuration files.

## Install

Clone the repository into `~/.local/opt/dotljc`:

```sh
mkdir -p ~/.local/opt
git clone https://codeberg.org/ljc/dotfiles.git ~/.local/opt/dotljc
```

Refer to the *README* file in each subfolder to set up the rest:

- [bash](bash/README.md)
- [git](git/README.md)
- [macos](macos/README.md)
- [python](python/README.md)
- [readline](readline/README.md)
- [ruby](ruby/README.md)
- [tmux](tmux/README.md)

## See also

- [dotvim](https://codeberg.org/ljc/dotvim) (Vim and NeoVim)

## TODO

This is building on a squashed and refactored copy of
[my old dotfiles repo](https://github.com/ljcooke/dotfiles).
The following have been excluded:

- *COLORS.md*
- macOS
- Slack colour scheme
- Sublime Text

This repo is transitioning to using the XDG Base Directory spec where possible,
to reduce home directory clutter. See:

- https://specifications.freedesktop.org/basedir-spec/latest/
- https://wiki.archlinux.org/title/XDG_Base_Directory
