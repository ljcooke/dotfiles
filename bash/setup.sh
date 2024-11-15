#!/usr/bin/env bash

set -euo pipefail

# Copy the templates to ~/.config/bash

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

echo Done
