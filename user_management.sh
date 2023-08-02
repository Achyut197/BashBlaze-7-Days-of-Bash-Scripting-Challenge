#!/bin/bash
#In this challenge, you will create a bash script that provides options for managing user accounts on the system. The script should allow users to perform various user account-related tasks based on command-line arguments.



echo "please enter a option:"
read OPTIONS
case "$OPTIONS" in
c) read -p "Enter username: " username
sudo useradd $username
echo " user account $username was created successfully"
;;
d) read -p "Enter username: " username
sudo userdel $username
echo "user account $delete was deleted sucessfully"
;;
r) read -p "Enter username: " username
sudo useradd $username
echo " user account $username was created successfully"
sudo passwd  $username
;;
l) list=$(cat /etc/passwd)
echo " list of user was displayed: $list "
;;
h) help
usage
;;
*) echo "Invalid option. Use -h or --help for usage."
        exit 1
        ;;

esac

