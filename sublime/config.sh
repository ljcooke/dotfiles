#!/usr/bin/env bash

set -o errexit
set -o nounset

SOURCE="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
TARGET=/usr/local/bin/subl

# Exit silently if not running on macOS
# or if Sublime Text is not installed
if [ $(uname) != Darwin ] || [ ! -e "$SOURCE" ]
then
    exit 0
fi

set -o xtrace

which subl && exit 0

test ! -e "$TARGET"
ln -s "$SOURCE" "$TARGET"
