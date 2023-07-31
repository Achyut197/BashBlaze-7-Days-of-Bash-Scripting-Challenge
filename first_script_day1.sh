#!/bin/bash
#task no-1- comment-:(here # is used for comment a line in a shell script)

# task no-2-here in this script we learned about 'echo` to print a message of your choice,
#task no-3-declares variables and assigns values to them,
#task no-4-two variables (numbers) as input and prints their sum using those variables.
#task no-5- least three different built-in variables to display relevant information.
#task no-6- wildcards to list all the files with a specific extension in a directory.

#task no-2-echo command is used to display message on the terminals.
echo "Hi,my name is Achyut Das."

#task no-3-declares variables and assigns values to them,
value=30
name="Achyut"
#task no-4-two variables (numbers) as input and prints their sum using those variables.
a=20
b=30
c=$(($a+$b))
echo "addtion no is $c"
#task no-5-least three different built-in variables to display relevant information.
# bash built-in variable gives information about current bash was used.
echo "$BASH"
# bash version  built-in variable gives information about which version was used in bash.
echo "$BASH_VERSION"
# $$ built-in variable gives information about holds the process ID (PID) of the current running shell script.
echo "$$"
# HOME built-in variable gives information about top-level directory in which the user's personal files and configurations are stored.
echo "$HOME"
# PWD built-in variable gives information about present working directory.
echo "$PWD"
# HOSTNAME built-in variable gives information about name of the current host.
echo "$HOSTNAME"
# HISTCMD built-in variable gives information about the current command number in the command history.
echo "$HISTCMD"
# LINENO built-in variable gives information about Current line number within the script or function.
echo "$LINENO"

#task no-6- wildcards to list all the files with a specific extension in a directory.
# ls is a command shows all the files and * represents wildcards which is used for searching zero or more character. 
ls *.sh
