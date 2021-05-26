#!/usr/bin/python3
import sys
import re
import os

def main( section_name ):
    file = os.path.expandvars('$HOME/.oh-my-zsh/custom/enhanced_profile.zsh')

    section_headers = []
    section = []

    section_found = False

    with open(file, 'r') as readfile:
        lines = readfile.read().splitlines()
        for section_index, line in enumerate( lines ):
            # print( line )
            # print( section_index )
            if( isHeader( line ) ):
                section_header = line.split("- ")[1].strip()
                # print("Section {0}: {1}".format(section_index, section_header))
                section_headers.append(section_header)
                # print("Checking : " + section_name + " is " + section_header + " > " + str( section_header.lower() == section_name.lower() ) )
                if( section_header.lower() == section_name.lower() ):
                    section_found = True
                    lower_bound = section_index - 1
                    for x in range(3):
                        section.append( lines[lower_bound+x] )
            else:
                if( section_found ):
                    for subline in lines[section_index+1:len( lines )-1]:
                        # print( "Subline: " + subline )
                        if( isBoundary( subline ) ):
                            # print( "Boundary at {0}".format( subline_index ) )
                            break
                        else:
                            section.append( subline )
                    break

    if(section_found):
        # print(*section, sep = "\n")
        print('\n'.join(map(str, section)))
    else:
        printAvailable( section_headers )

def isHeader( line ):
    return re.search( "^\\# - ", line )

def isBoundary( line ):
    return re.search( "^\\# ---", line )

def printAvailable(section_headers):
    section_headers = ["- " + header for header in section_headers]
    section_headers.sort()
    print("# ------------------------------------- #")
    print("# Available Sections:                   #")
    print("# ------------------------------------- #")
    # print(*section_headers, sep="\n")
    print('\n'.join(map(str, section_headers)))
    print("# ------------------------------------- #")


request = " ".join( sys.argv[1:] )
main( request )
