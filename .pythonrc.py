#!/usr/bin/env python
# vim: set fileencoding=utf-8 :

import os
import collections
import math
import random
import pickle
import pprint
import sys
import textwrap

from os import path
from pydoc import pager

# http://inky.github.com/see/
from see import see

sys.ps1 = '> '
sys.ps2 = '· '

pp = pprint.PrettyPrinter(indent=2).pprint

# http://tinyurl.com/bjtwrm
prettydict = lambda d: "\n".join(map("%s: %s".__mod__, d.items()))
def printdict(d):
    print(prettydict(d))

def enable_tab_completion():
    import rlcompleter, readline
    readline.parse_and_bind("tab: complete")
try:
    enable_tab_completion()
except:
    print("No tab completion. :(")

print('')  # I always hit enter after it loads anyway...
