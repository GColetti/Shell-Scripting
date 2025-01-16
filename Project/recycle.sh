# UNIX Project: Recycle and Restore
#  Phase 1: Basic Functionality
#!/bin/bash

# The recycle bin will be $HOME/recyclebin.
# Ensure that your script creates this directory.
if [ -d "~$HOME/recyclebin" ] 
then
    :
else
    mkdir -p $HOME/recyclebin
fi

# This scrip will use a hidden file called .restore.info in $HOME. 
# Ensure that your script creates this file.
if [ -f "$HOME/.restore.info" ] 
then
    :
else
    touch $HOME/.restore.info
fi

# The script must test for the following error conditions and display the same error messages as the rm command.
# - No filename provided - Display an error message if no filename is provided as an
# argument, and set an error exit status.
if [ $# -eq 0 ]
then
    echo "recycle: missing operand" 
    exit 1
# - File does not exist - Display an error message if file supplied does not exist, and
# terminate the script.
elif [ ! -e "$1" ]
then
    echo "recycle: cannot remove $1: No such file or directory"
    exit 2
# - Directory name provided - Display an error message if a directory name is
# provided instead of a filename, and terminate the script.
elif [ -d "$1" ]
then
    echo "recycle: $1: Is a directory"
    exit 21
# - Test that the file being deleted is not the recycle script. If it is, display the error
# message “Attempting to delete recycle – operation aborted” and terminate the script. 
# Be sure to create a hard link for your script before testing that this works.

# Check if the file to be deleted has the same inode number as the recycle script
elif [ "$(stat -c %i $0)" == "$(stat -c %i $1)" ]
then
    echo "recycle: Attempting to delete recycle - operation aborted"
    exit 1
else
    # The filenames in the recyclebin, will be in the following format: fileName_inode
    recycledfile="$1_$(stat -c %i $1)"
    # Each line of this file will contain the name of the file in the recyclebin, followed by a colon, followed by the original absolute path of the file.
    echo "$1_$(stat -c %i $1):$(readlink -f "$1")" >> $HOME/.restore.info
    #  Rename file to recycledfle variable
    mv $1 $recycledfile
    #  Move file to recycle bin
    mv "$recycledfile" "$HOME/recyclebin"
    exit 0
fi


