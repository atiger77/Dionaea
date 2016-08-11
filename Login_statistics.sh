#!/bin/bash
#
# Author: atiger77
# Date: 2016/08/11
# Version: V0.1
# Desc: A simple statistics script.

# Define
Log_location="/opt/Dionaea.log"
Most_login_ip=`awk -F: '{print $6}' Dionaea.log | uniq -c | head -n 1 `
Most_login_username=`awk  '{print $6}' Dionaea.log  | awk -F: '{print $2 }' |uniq -c | head -n 1`
Most_login_password=`awk  '{print $7}' Dionaea.log  | awk -F: '{print $2 }' |uniq -c | head -n 1`

# Check file exist.
if [ ! -f $Log_location ]; then
    echo  "Dionaea.log not exist,Please check it!!!"
    exit 404
else
   sleep 0.5
fi

# Login_statistics
echo -e "                       \033[31mNum\033[0m \033[33mResult\033[0m"
echo "Most login IP is:      " $Most_login_ip
echo "Most login username is:" $Most_login_username
echo "Most login password is:" $Most_login_password
