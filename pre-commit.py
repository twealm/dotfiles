#!/usr/bin/python

from subprocess import call
from subprocess import check_output
from subprocess import CalledProcessError
from sys import exit
import os

patterns = ["REMOVE_IT!"]

def print_found(name, line, text, pattern):
    """Prints message about found pattern in file. First parameter will be blue and second - red."""
    os.system("echo In $(tput setaf 4)" + name + "$(tput sgr 0)" + "  at line $(tput setaf 4)" + line + "$(tput sgr 0) found pattern $(tput setaf 1)" + pattern + "$(tput sgr 0):")
    os.system("echo " + text)

def print_searching(file_status, name, pattern):
    """Prints message about searching of pattern in file. File name will be blue,
    pattern in red."""
    status = ''
    if file_status == 'A':
        status = 'added '
    elif file_status == 'M':
        status = 'modified '
    os.system("echo Checking "+status+"file: $(tput setaf 4)"+name+"$(tput sgr 0) for pattern $(tput setaf 5)["+pattern+"]$(tput sgr 0)")

def files_list():
    """Check names of staged added or modified files in current working directory.
    Returns list of tuples containing file status (A for added and M for modified) 
    and file names.
    """
    output = check_output(["git", "diff", "--cached", "--name-status", "--diff-filter=AM"])
    lines = output.splitlines()
    pairs = []
    for line in lines:
        pair = file_pair(line.decode("utf-8"))
        pairs.append(pair)
    return pairs

def file_pair(line):
    """Takes string and tries to split into two parts using tab symbol as
    a delimeter. Returns tuple with two elements - left part and right part.
    It naively thinks that string contains delimeter."""
    temp = line.partition(b"\t")
    pair = temp[::2]
    return pair

def find_all_patterns((status, name)):
    """Tries to found strings from global patterns variable in file, whos name
    provided in tuple parameter"""
    result = False
    for pattern in patterns:
        print_searching(status, name, pattern)
        found = find_pattern(name, pattern)
        if len(found) != 0:
            result = True

        for (line, text) in found:
            print_found(name, line, text,  pattern)
    return result
            

def find_pattern(name, pattern):
    """Looks for pattern in file. If matches found will return list
    with tuples (line number, text). If no matches found then 
    will return empty tuple."""
    try:
        output = check_output(["grep", "-in", pattern, name])
    except CalledProcessError as e:
        return []
    else:
        return parse_grep_output(output)

def parse_grep_output(output):
    lines = output.splitlines()
    pairs = []
    for line in lines:
        pair = line.partition(':')
        pairs.append(pair[::2])
    return pairs

if __name__ == '__main__':
    pairs = files_list()
    result = 0
    for pair in pairs:
        found = find_all_patterns(pair)
        if found == True:
            result = 1
    exit(result)
