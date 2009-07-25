#!/usr/bin/env python
# vim: set fileencoding=utf-8 :

import math
import os
import pprint
import random
import sys
import textwrap

from pydoc import pager
from see import see

sys.ps1 = '> '
sys.ps2 = '· '

path = os.path
pp = pprint.PrettyPrinter(indent=2).pprint

try:
    import rlcompleter
    rlcompleter.readline.parse_and_bind("tab: complete")
except ImportError:
    print("Install readline for tab completion.")

print('')
