# Desc: This script will check Dionaea.log's md5.
#       Rember add this  script to crontab.
#       */5 * * * * /bin/bash /xxx(script-location)/Check.sh

# Define
Log_location="/opt/Dionaea.log"
Check_MD5_location="/opt/dionaea_md5check.txt"
Alarm_Email="atiger77@xxxx"
Dionaea_Hostname=`hostname`
Dionaea_HostIP=`ifconfig eth0 | sed -n 2p | awk  '{ print $2 }' `

# Check MD5 file.
if [ ! -s $Check_MD5_location ]; then
    echo `/usr/bin/md5sum $Log_location` > $Check_MD5_location
fi

# Contrast file.
Old_md5=`awk '{print $1}' $Check_MD5_location`
New_md5=`/usr/bin/md5sum $Log_location | awk '{print $1}'`
if [ $Old_md5 == $New_md5 ]; then
    sleep 0.5
else
    /usr/bin/md5sum $Log_location > $Check_MD5_location
    echo -e "Error,Please check \nhostname:$Dionaea_Hostname hostip:$Dionaea_HostIP" | mailx -s "Web_Dionaea logs was changed!" $Alarm_Email
fi
