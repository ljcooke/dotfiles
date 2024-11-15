# Bash

## Configure

Run `./setup.sh` to copy the template files to `~/.bashrc` and
`~/.bash_profile`. (The script will do nothing if those files already exist.)

Add machine-specific changes to `~/.bashrc` as needed.
(See [examples](local_examples.bash).)

Next: [Set up Readline](../readline/README.md)

## Reload

```sh
exec bash -l
```
