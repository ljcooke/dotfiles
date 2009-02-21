# echo 'export PYTHONSTARTUP=$HOME/.pythonrc.py' >> ~/.bashrc

import os, sys
import collections
import exceptions
import math
import random
import pickle
import pprint
import textwrap
from pydoc import pager
from see import see  # http://github.com/inky/see

sys.ps1 = '> '
sys.ps2 = '. '

pp = pprint.PrettyPrinter(indent=2).pprint

# http://tinyurl.com/bjtwrm
prettydict = lambda d: "\n".join(map("%s: %s".__mod__, d.items()))
def printdict(d):
    print prettydict(d)

def enable_tab_completion():
    import rlcompleter, readline
    readline.parse_and_bind("tab: complete")
try:
    enable_tab_completion()
except:
    print "No tab completion. :("
