#!/bin/bash
# this script perform the task-
# 1.Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
# 2.For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the ls command with appropriate options.
# 3.The list of files and directories will be displayed in a loop until the user decides to exit the explorer.
# 4.After displaying the file and directory list, the script will prompt the user to enter a line of text.
#1.display a welcome message
echo "------------------------------"
echo "Welcome to my file system"
echo "------------------------------"
#2.print its name and size in human-readable format (e.g., KB, MB, GB)
echo "List of files and directories with their sizes: $(ls -lh)"
#here size of the files and directory by using "ls -lh".
#3.list of files and directories will be displayed in a loop until the user decides to exit the explorer.
for i in $(ls $PWD)
#here ls PWD gives information about list of files which is present in working directory.By using for loop it will print all the files one by one which is present in working directory.
do
echo "directory and file list are $i "
read -p "Enter your choice (1 or 2): " input
#here iam using cases for exit from a loop.

    case $input in
        1)
            echo "Exiting the loop."
            break
            ;;
        2)
            # Perform any actions you want for option 2
            echo "Continuing..."
            ;;
        *)
            echo "Invalid choice. Please enter 1 or 2."
            ;;
    esac
done
# 4.After displaying the file and directory list, the script will prompt the user to enter a line of text.
echo "Please enter a line of text:"
read user

# Display the text
echo "You entry: $user"
#this line gives information each line user how many total no of character was enter by the user the commmand is  wc-c. 
char=$(echo -n "$user" | wc -c)
echo "Number of Characters is: $char"

