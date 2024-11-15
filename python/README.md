# Python

## Configure

 1. Create a symlink to the [`pythonrc.py`](pythonrc.py) file
    (this can be run from any directory):

    ```sh
    ln -s .ljc/python/pythonrc.py $HOME/.pythonrc
    ```

 1. Create the state directory to store the Python history file
    (defined in `env.bash`):

    ```sh
    mkdir -p ~/.local/state/python
    chmod 700 ~/.local/state/python
    ```
