#!/bin/bash
USERID=$(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Run the script with root access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is failed.. pls check"
        exit 1
    else
        echo "$2 is SUCCESS"
    fi
}

CHECK_ROOT

echo "script executed time: $(date)"

dnf list installed ansible
if [ $? -ne 0 ]
then
    echo "ansible not installed. installing now"
    dnf install ansible -y
    VALIDATE $? "Ansible instalation"
else
    echo "ansible already installed. nothing to do."
fi