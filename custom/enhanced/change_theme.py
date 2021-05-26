#!/usr/bin/python3
import sys
import re
import os

def main(theme):
    file = os.path.expandvars('$HOME/.zshrc')

    if theme == 'default':
        theme = 'robbyrussell'

    new_string = 'ZSH_THEME="{}"\n'.format(theme)
    
    read_file = []
    
    with open(file,'r') as readfile:
        for line in readfile:
            read_file.append(line)
    with open(file,'w') as writefile:
        for line in read_file:
            if 'ZSH_THEME="' in line:
                writefile.write(new_string)
            else:
                writefile.write(line)
    print("Changed the ZSH Theme!")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("You need to supply a theme.")
    else:
        main(sys.argv[1])