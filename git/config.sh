#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

git config --global 'alias.br'   'branch'
git config --global 'alias.co'   'checkout'
git config --global 'alias.pick' 'cherry-pick'
git config --global 'alias.st'   'status'
git config --global 'alias.when' 'blame'

git config --global 'alias.l1'     'log --pretty=oneline'
git config --global 'alias.lg'     'log --decorate=short --date-order --graph --date=iso'
git config --global 'alias.mm'     'merge --no-ff'
git config --global 'alias.ff'     'merge --ff-only'
git config --global 'alias.cached' 'diff --cached'
git config --global 'alias.unadd'  'reset HEAD --'

git config --global 'alias.amend-new'  'commit --amend --reset-author'
git config --global 'alias.initcommit' '!git init && git commit -m Init --allow-empty'

git config --global 'color.ui'     'auto'
git config --global 'color.diff'   'auto'
git config --global 'color.branch' 'auto'
git config --global 'color.status' 'auto'

git config --global 'core.fileMode'         'true'
git config --global 'core.fsyncObjectFiles' 'true'
git config --global 'core.quotePath'        'false'

git config --global 'diff.renames' 'copies'

git config --global 'push.default' 'current'
