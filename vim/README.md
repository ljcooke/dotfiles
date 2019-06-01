# Vim

## Setup

Run the following commands to generate a `doc/tags` file for each Vim plugin
that has a `doc` directory:

```sh
vim -c ':call pathogen#helptags()' +qall
find vim/bundle -type f -name tags
```

This enables us to read the documentation using the `:help` command.

## bundle directory

- [edit-commentary](https://github.com/tpope/vim-commentary)
- [edit-easy_align](https://github.com/junegunn/vim-easy-align)
- [edit-endwise](https://github.com/tpope/vim-endwise)
- [edit-rsi](https://github.com/tpope/vim-rsi)
- [ft-csv](https://github.com/chrisbra/csv.vim)
- [ft-fish](https://github.com/aliva/vim-fish)
- [ft-fortune](https://github.com/ljcooke/vim-fortune)
- [ft-graphviz](https://github.com/wannesm/wmgraphviz.vim)
- [ft-io](https://github.com/andreimaxim/vim-io)
- [ft-javascript](https://github.com/pangloss/vim-javascript)
- [ft-ledger](https://github.com/ledger/vim-le)
- [ft-markdown-github](https://github.com/rhysd/vim-gfm-syntax)
- [ft-mediawiki](https://github.com/chikamichi/mediawiki.vim)
- [ft-org](https://github.com/jceb/vim-orgmode)
- [ft-pgn](https://github.com/artoj/pgn-syntax-vim)
- [ft-qif](https://github.com/ljcooke/vim-qif)
- [ft-ruby-bundler](https://github.com/tpope/vim-bundler)
- [ft-toml](https://github.com/cespare/vim-toml)
- [sensible](https://github.com/tpope/vim-sensible)
- [ui-lightline](https://github.com/itchyny/lightline.vim)
- [util-speeddating](https://github.com/tpope/vim-speeddating) (required by ft-org)
- [util-syntaxrange](https://github.com/vim-scripts/SyntaxRange)
