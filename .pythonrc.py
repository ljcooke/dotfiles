import os, sys
import math, random

sys.ps1 = '> '
sys.ps2 = '. '

def enable_tab_completion():
    import rlcompleter, readline
    readline.parse_and_bind("tab: complete")
enable_tab_completion()
