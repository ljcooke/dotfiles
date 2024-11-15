# Bash

## Configure

Run `./setup.sh` to set up the bash config. This does the following:

- Copies template configuration files to `~/.bashrc` and `~/.bash_profile`
  (or does nothing if those files exist).

- Creates a directory for bash history at `~/.local/state/bash`, if it doesn't
  exist, and sets the permissions to user-readable only (700).

Add machine-specific changes to `~/.bashrc` as needed.
(See [examples](local_examples.bash).)

Next: [Set up Readline](../readline/README.md)

## Reload

```sh
exec bash -l
```
