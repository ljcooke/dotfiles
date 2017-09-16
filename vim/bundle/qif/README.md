vim-qif
=======

## Features

This is a plugin for Vim which adds support for [QIF][qif] (Quicken) files.

[qif]: https://en.wikipedia.org/wiki/Quicken_Interchange_Format

Features:

  - Syntax highlighting.

  - Move between transactions using the `[[` and `]]` commands.

## Install

This project follows the standard runtime path structure.

  - Install using native packages in Vim 8:

        $ git clone https://github.com/araile/vim-qif.git ~/.vim/pack/plugins/start/vim-qif

  - Install using Pathogen:

        $ git clone https://github.com/araile/vim-qif.git ~/.vim/bundle/vim-qif

## Usage

While editing a QIF file, enter the command:

    :set filetype=qif

This is done automatically if the filename ends with the extension `.qif`.

## License

Licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
