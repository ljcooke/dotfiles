#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

SOURCE="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
TARGET=/usr/local/bin/subl

which subl && exit 0

test -e "$SOURCE"
test ! -e "$TARGET"

ln -s "$SOURCE" "$TARGET"
