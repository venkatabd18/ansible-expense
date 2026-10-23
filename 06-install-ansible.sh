#!/bin/bash
USERID=(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Run the script with root access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 - ne 0 ]
    then
        echo "$2 is failed pls checke"
        exit 1
    else
        echo "$2 is success"
}

CHECK_ROOT

echo "Script execution time is : $(date)"

dnf list installed ansible
if [ $? -ne 0 ]
    then
        echo "Ansible not installled. Installing now"
        dnf install ansible -y
        VALIDATE $? "Ansible install"
    else
        echo "Ansible already installed nothing to do"
    fi