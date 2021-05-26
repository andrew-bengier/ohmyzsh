#!/usr/bin/python3
import sys
import re
import os

def main():
    file = os.path.expandvars('$HOME/.oh-my-zsh/plugins/git/git.plugin.zsh')

    print("# ------------------------------------- #")
    print("# Default Git Plugin:                   #")
    print("# ------------------------------------- #")
    
    with open(file, 'r') as readfile:
        lines = readfile.read().splitlines()
        for line in lines:
            print( line )

    print("# ------------------------------------- #")

main()
