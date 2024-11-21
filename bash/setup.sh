#!/usr/bin/env bash

set -euo pipefail


echo '--- Copying templates'

if [ -e "$HOME/.bashrc" ]; then
  echo "$HOME/.bashrc exists"
else
  cp -v template/.bashrc "$HOME/"
fi

if [ -e "$HOME/.bash_profile" ]; then
  echo "$HOME/.bash_profile exists"
else
  cp -v template/.bash_profile "$HOME/"
fi


echo '--- Preparing XDG_STATE_HOME'

state_dir=${XDG_STATE_HOME:-$HOME/.local/state}

for dir in bash less redis sqlite
do
  dir="${state_dir}/${dir}"
  [ ! -e "$dir" ] && mkdir -pv "$dir"
  chmod 700 "$dir"
done


echo '--- Done'
