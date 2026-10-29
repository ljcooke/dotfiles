#!/usr/bin/env bash

set -euo pipefail

conf_dir=${XDG_CONFIG_HOME:-$HOME/.config}/tmux
conf_path=${conf_dir}/tmux.conf
legacy_path=$HOME/.tmux.conf

if [ -e "$conf_path" ]; then
  echo "File exists: ${conf_path}"
  exit
elif [ -e "$legacy_path" ]; then
  echo "File exists: ${legacy_path}"
  exit
fi

mkdir -p "$conf_dir"

echo "Copying template to ${conf_path}"
cp "$HOME/.local/opt/dotljc/tmux/local.tmux.conf" "$conf_path"
echo 'Done'

sys=$(uname -s)
if [ "$sys" = Darwin ]; then
  echo ''
  echo "Edit ${conf_path} to configure for macOS."
fi
