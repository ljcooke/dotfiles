# echo 'export PYTHONSTARTUP=$HOME/.pythonrc.py' >> ~/.bashrc

import os, sys
import math, random
import textwrap

from pydoc import pager

# http://github.com/inky/see/tree/master
from see import see

sys.ps1 = '> '
sys.ps2 = '. '

def enable_tab_completion():
    import rlcompleter, readline
    readline.parse_and_bind("tab: complete")
enable_tab_completion()
