# -----------------------------------------------------------------------------
# Additional Bash config for macOS
# -----------------------------------------------------------------------------

source $HOME/.bash/platform_bsd.bash

#
# Open a man page in Preview.
# Requires ps2pdf -- run `brew install ghostscript` to install this.
#
if [ -n "`which ps2pdf`" ]
then
    function pman()
    {
        man -t $* | ps2pdf - - | open -f -a /Applications/Preview.app
    }
fi

#
# Open MacVim in the foreground without forking.
#
alias fvim="/usr/local/bin/mvim -f -c 'au VimLeave * !open -a Terminal'"
