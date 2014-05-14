#!/bin/bash
set -o errexit
set -o nounset
set -o verbose

git submodule init
git submodule update

git pull --recurse-submodules
git submodule update --recursive
git submodule foreach 'git checkout master && git pull'
git submodule status
