#!/usr/bin/python3
import sys
import argparse

nato_alphabet = {
    'a': 'alpha',
    'b': 'bravo',
    'c': 'charlie',
    'd': 'delta',
    'e': 'echo',
    'f': 'foxtrot',
    'g': 'golf',
    'h': 'hotel',
    'i': 'india',
    'j': 'juliet',
    'k': 'kilo',
    'l': 'lima',
    'm': 'mike',
    'n': 'november',
    'o': 'oscar',
    'p': 'papa',
    'q': 'quebec',
    'r': 'romeo',
    's': 'sierra',
    't': 'tango',
    'u': 'uniform',
    'v': 'victor',
    'w': 'whiskey',
    'x': 'x-ray',
    'y': 'yankee',
    'z': 'zulu'
}

def printAlphabet():
    for key, value in nato_alphabet.items():
        print(key + ' : ' + value)

parser = argparse.ArgumentParser(description='Translate word into NATO phonetic alphabet.')
parser.add_argument('-a', '--all', action="store_true", help='show all phonetic letters')

# Read arguments from the command line
args, unknown = parser.parse_known_args()

if args.all:
    printAlphabet()
else:
    for word in sys.argv[1:]:
        for letter in word:
            if letter.lower() not in nato_alphabet:
                print(letter)
            else:
                print(letter + " - " + nato_alphabet[letter])