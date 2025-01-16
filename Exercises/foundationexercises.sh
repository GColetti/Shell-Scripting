# ----- Exercise 1: File Systems -----
# Create a directory in your home directory called tradingSystem.
1.  mkdir tradingSystem

# Create 2 files in your home directory called countries and places.
2. touch countries places

# Move the countries file to your tradingSystem directory. 
# Rename the places file with a new name of cities
# Copy the cities file to your tradingSystem directory
3. mv coutries tradingSystem
   cp places cities
   cp citites tradingSystem/cities

# Create a file called myProgram in your home directory. Look at the permissions on myProgram.
# Change the permissions on myProgram to -rwxr-x--x
4. touch myProgram
   ls -l myProgram
   chmod ug+rwx,o-r myProgram

# Create a directory called temp.
# Copy your myProgram into temp.
# Delete the temp directory and all its contents.
5. mkdir temp
   cp myProgram temp
   rm -r temp

# Identify the type of contents held in the following files using the file command
6. file /etc/hosts
   file /dev/fd/0 
   file dev/tty0 
   file /bin/touch

# Copy all the files from /student_files which end in .dat to your tradingSystem directory
7. cp ~/student_files/*.dat ~/tradingSystem

# Copy the directories day1 and day2 and their contents, from /student_files into your
# home directory
8. cp -r /student_files/day{1,2} ~/tradingSystem

# Move into your tradingSystem directory. Identify the biggest file in this directory
9. ls -S ~/tradingSystem 

# Display the last 2 lines of the places.dat file.
10. tail -2 place.dat

# Display the first 5 lines of the companies.dat file.
11. head -5 companies.dat

# ----- Exercise 2: Redirection and Piping -----
# List all the contents of your home directory and save the output in a file called homeList. 
# List the contents of your tradingSystem directory and append to the homeList file.
1. ls ~/home > homeList
   ls ~/tradingSystem >> homeList

# Store the last 20 lines of the /etc/passwd in a file called newUsers.
2. tail -20 /etc/passwd > newUsers

# List the contents of your home directory and then count the number of lines in this output.
# • Step 1 list the contents of your directory
# • Step 2 identify the command to count the number of lines
# • Step 3 combine these commands with a pipe
3. ls ~/home | wc -l

# List the contents of your home directory. Store this output in a file called newHomeList, and then count the lines of this output
4. ls ~/home > newHomeList | wc -l newHomeList

# Using the head and tail commands display only line 3 from the companies.dat file in your tradingSystem directory
5. head -n 3 ~/tradingSystem/companies.dat  | tail -n ~/tradingSystem/companies.dat 

# List the contents of your home directory, ordered by size. Keep the entries for the five biggest files and output them to a file called bigFiles.txt.
6. ls -S ~/home | head 5 > bigFiles.txt

# List the files that end in .dat in the /student_files directory, sending the output to a file called datFiles. Also, display on screen how many files were found.
7. ls ~/student_files/*.dat | tee datFiles.txt | wc -z -l datFiles.txt

# Display lines 7-9 of brokers.dat
8. head -n 9 brokers.dat | tail -n 3 brokers.dat

# ----- Exercise 3: Searching and Pattern Matching -----
# 1. Move to your tradingSystem directory.
   cd ~/tradingSystem

# 2. Using the brokers.dat file
# • Identify all the brokers called Smith
   grep -i 'Smith' brokers.dat

# • List all lines that do not start with a number
   grep -v '^[^0-9]' brokers.dat

# • Identify all the brokers whose last name ends with n
   grep 'n$' brokers.dat

# 3. Using the companies.dat file
# • Identify all the companies with a letter b in their name, upper or lower case
   grep -i '[b]' companies.dat
# • Display the number of companies with a b in their name
   grep  '[b]' companies.dat
# • Identify all the companies with more than 1 word in their name
   grep '\s' companies.dat

# 4. Using the currency.dat file
# • Identify all the British currencies
   grep -i 'british' currency.dat
# • Display the line that contains the $ symbol (No cheating – search for the $)
   grep '\$' currency.dat

# 5. Find all the files in your home directory and its subdirectories which have a filename ending in .dat
   find ~/home -name "*.dat"

# 6. Find all the files within the /student_files directory which are larger than 1k in size and display their size
   find ~/student_files -size +100k -exec wc -c {} \;

# 7. Find all empty files in your home directory and interactively remove them
   find  ~/home -empty –ok rm {} \; 

# 8. List the contents of your home directory and display only the lines which refer to files
   ls ~/home | grep -v '^d'

# 9. What does the following command do?
#    find /var –mtime -36 –print
#        -> Finds all files in /var that have been modified in the last 36 days
# • Run this command and inspect results
# • Run this command and redirect the errors to /dev/null
# • What is the advantage of redirecting the errors?
#        -> Discards the error messages
# • What does /dev/null mean?
   find /var –mtime -36 –print 2> /dev/null

# ----- Exercise 4: Job Control -----
# 1. Run the sleep command for 1000 seconds in the background
   sleep 1000 &

# 2. Use the ps command to identify the PID of the sleep command
   ps -ef | grep sleep

# 3. Kill the sleep command and check it was successful
   kill -9 PID

# 4. Start another sleep command for 1000 seconds in the background
   sleep 1000 &

# 5. Use the jobs command to identify the JID of the sleep command
   jobs -l

# 6. Bring the sleep command into the foreground
   fg % JID

# 7. Kill the sleep command and check it was 
   kill -9 $JID

# ----- Exercise 5: vi -----
# 1. Create a file called accounts using the vi editor.
   vi accounts

# 6. Which command(s) will display the contents of the accounts file?
   cat accounts
   more accounts
   less accounts

# ----- Exercise 6.1: More Commands -----
# 1. Display the fifth character of each line in the accounts file.
   cut -c5 < accounts

# 2. Display the fifth character of “FDM Academy”.
   echo "FDM Academy" | cut -c5

# 3. We can also provide a range. Now give the command to display the first 4 characters
# of each line in the accounts file.
   cut -c1-4 < accounts

# 4. Display the first and sixth characters of each line in the accounts file.
   cut -c1,6 < accounts

# 5. Display the first and last names for every person in the accounts file.
   cut -d ':' -f2 < accounts

# 6. Display the account type and balance for every person in the accounts file. Replace
# the colon with a space.
   cut -d ':' -f3,4 < accounts | tr ':' ' '

# 7. Retrieve Ray Manzarek’s balance.
   grep -i 'Ray' < accounts | cut -d ':' -f4

# ----- Exercise 6.2: More Commands -----
# 1. Use the head command to print the first 5 lines of /etc/passwd file.
   head -5 /etc/passwd

# 2. Use head and sort commands together to display the first 5 lines in alphabetical order.
   head -5 /etc/passwd | sort -d

# 3. Use –t option to define the delimiter and –k option to define the field. Display the accounts file sorted by last name.
   sort -t' ' -k2  < accounts

# 4. Use –n option to sort the accounts file numerically by balance.
   sort -n -t':' -k4 < accounts

# 5. The –r option can be used to reverse order. Use cut and sort command together to print the account types in reverse order for every user in accounts 
   cut -d ':' -f3 accounts | sort -r

# 6. Use output redirection to store every account holder’s first and last names in alphabetical order in the file called “sortedByName.txt"
   cut -d ':' -f2 accounts | sort > sortedByName.txt

# ----- Exercise 6.3: More Commands -----
# 1. Change all the digits in the accounts file to *.
   tr '0-9' '*' < accounts

# 2. Use –d option to delete the capital letters from the accounts file
   tr -d 'A-Z' < accounts

# 3. Print first and last names in capital letters for every user in accounts file
   cut -d ':' -f2 accounts | tr 'a-z' 'A-Z'

# 4. Use output redirection to store accounts file as a comma-separated file called
# commaStorage.txt
   cut -d ':' -f1-4 accounts |  tr ':' ',' > commaStorage.txt

# 5. Print only the pin numbers for each user in the accounts file without the string “PIN”
   cut -d ':' -f1 accounts | tr -d 'PIN'

# ----- Exercise 7: Using Basic UNIX Commands -----
# 1. Count how many lines the sleep command is used inside of /student_files/day1/batchprog. (11 lines)
   grep -c sleep /student_files/day1/batchprog

# 2. Display the account details for pin number 534 from the accounts file
   grep -i '534' < accounts

# 3. Retrieve the users’ username from the /etc/passwd file in alphabetical order.
   cut -d ':' -f1 /etc/passwd | sort

# 4. Count how many regular files you have in your home directory. Count how many directories you have in your home directory.
   find . -type f | wc -l
   find . -type d | wc -l

# 5. Display your details from the finger command in upper letters.
   finger | tr 'a-z' 'A-Z'

# 6. Retrieve the second line of accounts file
   head -2 accounts | tail -1

# 7. Store the total line number of accounts file into a file called totalLine.txt.
   wc -l accounts > totalLine.txt

# 8. Delete the second line of the accounts file and store it in deletedStorage.txt file.
# Hint: You may need to use temporary files.
   head -2 accounts | tail -1 > deletedStorage.txt

# 9. What is the difference between the more and less commands?
   # more: single file seperated by lines
   # less: switch between files