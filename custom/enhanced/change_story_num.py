#!/usr/bin/python3
import sys
import re
import os

def main(story_num):
    file = os.path.expandvars('$HOME/.oh-my-zsh/custom/enhanced_profile.zsh')

    # r = re.compile(r"export TEST_NAME='([A-Za-z0-9\s-]+)'")
    # new_string = f"export STORY_NUM='[{story_num}] - '\n'"
    new_string = "export STORY_NUM='[{}] - '\n".format(story_num)
    
    read_file = []
    
    with open(file,'r') as readfile:
        for line in readfile:
            read_file.append(line)
    with open(file,'w') as writefile:
        for line in read_file:
            if 'export STORY_NUM' in line:
                writefile.write(new_string)
            else:
                writefile.write(line)
    print("Changed the Story Number for git!")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("You need to supply a story number ex: XXX-###")
    else:
        main(sys.argv[1])