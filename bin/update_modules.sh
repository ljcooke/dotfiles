#!/bin/bash
set -o errexit
set -o nounset

function echotask() {
    text=$1
    echo -e "\033[1;34m==>\033[0m \033[1m${text}\033[0m"
}

#------------------------------------------------------------------------------
# Init & pull the latest changes

echotask 'Registering modules'
git submodule init

echotask 'Checking out modules'
git submodule update --recursive

echotask 'Pulling module changes'
git submodule foreach 'git checkout -f master && git pull --depth=1 origin'
git submodule status

#------------------------------------------------------------------------------
# Update individual modules

echotask 'Updating pathogen'
cp -a -v modules/vim-pathogen/autoload/pathogen.vim home/.vim/autoload/

echotask 'Updating rust.vim'
dest=$PWD/home/.vim/bundle/rust/
pushd modules/rust.vim
git --work-tree="$dest" checkout -f HEAD
popd > /dev/null

echotask 'Updating tumblr'
cp -a -v modules/tumblr/vim/syntax/tumblr.vim home/.vim/syntax/

#------------------------------------------------------------------------------
echotask 'Done'
