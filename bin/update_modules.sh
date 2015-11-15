#!/bin/bash
set -o errexit
set -o nounset

function echotask() {
    text=$1
    echo -e "\033[1;34m==>\033[0m \033[1m${text}\033[0m"
}

function checkout_module() {
    module=$1
    mkdir -p "$2"
    pushd "$2" > /dev/null
    dest=$PWD
    popd > /dev/null
    pushd "$module" > /dev/null
    git --work-tree="$dest" checkout -f HEAD
    popd > /dev/null
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

echotask 'Updating rust.vim'
checkout_module "modules/rust.vim" "home/.vim/bundle/rust"

echotask 'Updating tumblr'
cp -a -v modules/tumblr/vim/syntax/tumblr.vim home/.vim/syntax/

echotask 'Updating vim-colors-solarized'
checkout_module "modules/vim-colors-solarized" "home/.vim/bundle/colors-solarized"

echotask 'Updating vim-pathogen'
cp -a -v modules/vim-pathogen/autoload/pathogen.vim home/.vim/autoload/

echotask 'Updating vim-surround'
checkout_module "modules/vim-surround" "home/.vim/bundle/surround"

#------------------------------------------------------------------------------
echotask 'Done'
