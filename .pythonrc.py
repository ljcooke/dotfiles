# echo 'export PYTHONSTARTUP=$HOME/.pythonrc.py' >> ~/.bashrc

import os, sys
import math, random
import textwrap

from pydoc import pager

# http://github.com/inky/see/tree/master
from see import see

# http://github.com/darius/columnize/tree/master
from columnize import see as cee

sys.ps1 = '> '
sys.ps2 = '. '

# http://tinyurl.com/bjtwrm
prettydict = lambda d:"\n".join(map("%s: %s".__mod__, d.items()))
def printdict(d):
    print prettydict(d)

def enable_tab_completion():
    import rlcompleter, readline
    readline.parse_and_bind("tab: complete")
try:
    enable_tab_completion()
except:
    print "No tab completion. :("
