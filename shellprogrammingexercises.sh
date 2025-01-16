# ----- Exercise 1: Introduction to Shell Scripting -----
# 1. Write a script called myVars that displays the following variables $HOME, $LOGNAME and $PATH.
    echo $HOME
    echo $LOGNAME
    echo $PATH

# 2. Write a script called greeting which displays a welcome message as follows “Hello firstname.lastname”. 
# In your script replace firstname.lastname with your actual UNIX username.
# For example if your UNIX username is joe.bloggs, your script should display
# Hello joe.bloggs


# 3. Write a script called createFiles that creates a directory called mydir and three files called myfile1, myfile2 and myfile3. 
# This script will generate no output. You will need to check it has worked.

# 4. Write a script called moveFiles that moves myfile1, myfile2 and myfile3 into mydir. 
# Display a message informing the user that the move operation is complete and then display the contents of the mydir directory.
# Your output should be:-move operation completed myfile1 myfile2 myfile3

# 5. Write a script called lions6 that displays the first 6 lines of /examples/lionsInTheStreet file.

# 6. Write a script called fileCount that counts how many files and directories you have in your ~ directory

# ----- Exercise 2: Variables and Command Substitution -----
1.
#!/bin/bash
echo "PLease enter word"
read word

2.
#!/bin/bash
echo "please enter word"
read word
echo "$word" | tr -d '\n' | wc -m

3.
#!/bin/bash
echo "Please enter word"
read word
letters = $("$word" | tr -d '\n' | wc -m
echo "The word $word has $letters letters"

6.
#!/bin/bash
touch $1
stat -c '%i' $1

7.
#!/bin/bash
mv $1 "$1.$2"

# ----- Exercise 3: Conditional Scripts -----
# ----- Exercise 4: Using Flow Control - Loops -----
# ----- Exercise 5: Functions -----
