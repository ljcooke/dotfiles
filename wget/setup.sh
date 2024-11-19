#!/usr/bin/env bash

set -euo pipefail

config_dir=${XDG_CONFIG_HOME:-$HOME/.config}/wget
cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/wget
config_path=${config_dir}/wgetrc
hsts_path=${cache_dir}/hsts

mkdir -p "$config_dir" "$cache_dir"
chmod 700 "$config_dir" "$cache_dir"

if [ -e "$config_path" ]; then
  echo "Add the following line to ${config_path}:"
  echo
  echo "hsts-file = ${hsts_path}"
else
  echo "Creating $config_path"
  echo hsts-file \= "$hsts_path" >> "$config_path"
fi
