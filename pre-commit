#!/bin/bash
# Author: Illia Akhaiev
# Based on code by Nikolas Dimopoulos, Remigijus Jarmalavičius
# Checks the files to be committed for the presence of forbidden terms.
# The array below (checks) can be extended for further checks

# Array of forbidden sentences.
checks[1]="REMOVE IT!"

element_count=${#checks[@]}
let "element_count = $element_count + 1"

ROOT_DIR="$(pwd)/"
ERRORS_BUFFER=""

# Get SHA to compare with
if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# List of files that will be commited
files=$(git diff --cached --name-only --diff-filter=AM $against)

printf "\n"

for file in $files
do
    index=1
    while [ "$index" -lt "$element_count" ]
    do
        echo "Checking file: $(tput setaf 4)$file$(tput sgr 0) for pattern $(tput setaf 5)[${checks[$index]}]$(tput sgr 0)" 
        ERRORS=$(grep "${checks[$index]}" $ROOT_DIR$file >&1)
        if [ "$ERRORS" != "" ]; then
            if [ "$ERRORS_BUFFER" != "" ]; then
                ERRORS_BUFFER="$ERRORS_BUFFER\n$ERRORS"
            else
                ERRORS_BUFFER="$ERRORS"
            fi
            echo "$(tput setaf 4)$file$(tput sgr 0) contains pattern $(tput setaf 1)${checks[$index]}$(tput sgr 0)" 
        fi
        let "index = $index + 1"
    done
done

if [ "$ERRORS_BUFFER" != "" ]; then
    echo 
    echo "These errors were found in try-to-commit files: "
    echo "$(tput setaf 1)"
    echo -e $ERRORS_BUFFER
    echo "$(tput sgr 0)"
    echo 
    echo "Can't commit, fix errors first."
    exit 1
else
    echo "Commited successfully."
fi
