#!/bin/sh
#
# Problem: UNIX has no recycle bin. When you remove a file or directory, it is gone and
# cannot be restored. This project is to write a remove and restore to provide users with a
# recycle bin which can be used to safely delete and restore files.
#
# @name remove.sh # FIX ME
# @usage sh remove.sh fileName
# @author nalam
# @date 2017-09-03
#
# Phase 1 - Basic Functionality
# Write a script called remove that mimics the rm command - remove shold be able to
# accept the name of a file as a command line argument as rm does, but instead of deleting
# the file your script should move it to a recycle bin directory called deleted in your home
# directory.

FILE="$1"
RM="remove.sh" # FIX ME

E_INVALID=1
E_VALID=0

if [[ -f "$FILE" ]]; then
    if [ "$FILE" == "$RM" ]; then
        # 7
        echo "Attempting to delete remove - operation aborted"
        exit $E_INVALID
    fi
    
    # 2
    mkdir -p $HOME/deleted
    
    # 5
    inode=`ls -i $FILE | awk '{print $1}'`
    FILENAME=$(basename $1)
    DELETEDFILE="$FILENAME"
    DELETEDFILE+="_$inode"    
    mv $FILE $HOME/deleted/$DELETEDFILE

    # 6
    echo "$DELETEDFILE:$PWD/$FILE" >> $HOME/.restore.info

    mv $HOME/deleted/$DELETEDFILE $HOME/project/$FILE
elif [[ $# -eq 0 ]]; then
    echo "usage: sh remove fileName"
    exit $E_INVALID
elif [[ -d "$FILE" ]]; then
    echo "remove: $FILE is a directory"
    exit $E_INVALID
elif [[ ! -f "$FILE" ]]; then
    echo "remove: $FILE: No such file or directory"
    exit $E_INVALID
fi
