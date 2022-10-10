#!/bin/bash

# filesearch.sh
DIRPATH=$HOME/'Documents'
# Get the filepath from the user
FILEPATH=$(ls $DIRPATH | wofi -d)

if [ "$FILEPATH" == ".." ]; then
    exit 1
elif [ -z "$FILEPATH" ]; then
    exit 1
else
    echo $DIRPATH/$FILEPATH
    neovide $DIRPATH/$FILEPATH | wofi -d
fi

