#!/bin/bash
set -o errexit
set -o nounset

if [ "$(uname)" != Darwin ]; then
    echo 'This script must be run in Mac OS X.' >&2
    exit 1
fi

function echotask() {
    text=$1
    echo -e "\033[1;34m==>\033[0m \033[1m${text}\033[0m"
}

function promptupdate() {
    echotask "$1"
    select yn in Yes No; do
        case $yn in
            Yes) return 0;;
            No) return 1;;
        esac
    done
}

#------------------------------------------------------------------------------
dockrestart=0

if promptupdate 'Disable the dashboard?'; then
    defaults write com.apple.dashboard mcx-disabled -bool YES
    killall Dashboard || true
    echo OK
fi

if promptupdate 'Mark hidden apps in the dock?'; then
    defaults write com.apple.dock showhidden -bool YES
    dockrestart=1
    echo OK
fi

if promptupdate 'Show the ~/Library folder in Finder?'; then
    chflags nohidden ~/Library
    echo OK
fi

#------------------------------------------------------------------------------

if [ $dockrestart = 1 ]; then
    echotask 'Killing the dock'
    killall Dock || true
    echo 'The dock should reappear in a moment.'
fi

echotask 'Done'
