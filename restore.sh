# UNIX Project: Recycle and Restore
#  Phase 2: Basic Restore
#!/bin/bash

 # Get file path from .restore.info file
restoredfilepath=$(grep "$1" $HOME/.restore.info | cut -d ":" -f2)

# No filename provided - Display an error message if no file provided as argument,
# and set an error exit status.
if [ $# -eq 0 ]
then
    echo "restore: missing operand"
    exit 1
# File does not exist - Display an error message if file supplied does not exist, and terminate the script.
elif [  ! -e  "$HOME/recyclebin/$1" ]
then
    echo "restore: cannot restore $1: No such file or directory"
    exit 2
else
    # The script must check whether the file being restored already exists in the target directory
    if [ -e "$restoredfilepath" ]
    then
        #  The script must restore the file if the user types y, Y, or any word beginning with y or Y to this prompt, and not restore it if they type anything else.
        echo "restore: Do you want to overwrite? (y/n)"
        read -r answer
        # If answer starts with y, Y, or any word beginning with y or Y
        if [[ "$answer" =~ ^(y|Y) ]];
        then
            # The script must restore the file to its original location, using the pathname stored in the .restore.info file
            mv -i $HOME/recyclebin/$1 $restoredfilepath
            echo "restore: $1 restored to $restoredfilepath"
            # After the file has been successfully restored, the entry in the .restore.info file will be deleted.
            grep -v "$1" "$HOME/.restore.info" > tmpfile && mv tmpfile "$HOME/.restore.info" | exit 0
        else
            echo "restore: $1 not restored" 
            exit 0
        fi
    else
        # The script must restore the file to its original location, using the pathname stored in the .restore.info file
        mv -i $HOME/recyclebin/$1 $restoredfilepath
        echo "restore: $1 restored to $restoredfilepath"
        # After the file has been successfully restored, the entry in the .restore.info file will be deleted.
        grep -v "$1" "$HOME/.restore.info" > tmpfile && mv tmpfile "$HOME/.restore.info" | exit 0
    fi
fi