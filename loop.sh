#!/bin/sh
a=1
b=100
 until [ $a -ge 200 ]
 do
 echo " this loop configure from EVI $a to EVI $b"
 echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
 echo '----------------------------------------------------------------------'
 echo '----------------------------------------------------------------------'
 echo '!'
 echo '!'
 echo '!'
 echo '!'
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b',"QOS_REQUIRED":'NO'}' --tags create_service
 echo " this loop completed configuration from EVI $a to EVI $b"
 echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
 echo '----------------------------------------------------------------------'
 echo '----------------------------------------------------------------------'
 echo '!'
 echo '!'
 echo '!'
 echo '!'
 a=`expr $a + 100`
 b=`expr $b + 100` 
 done
ansible-playbook EE_ELAN.yml --tags verify_service
a=1
b=100
 until [ $a -ge 200 ]
 do
 echo " this loop delete services from EVI $a to EVI $b"
 echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
 echo '----------------------------------------------------------------------'
 echo '----------------------------------------------------------------------'
 echo '!'
 echo '!'
 echo '!'
 echo '!'
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b',"QOS_REQUIRED":'NO'}' --tags delete_service
 echo " this loop completed deletion of EVI $a to EVI $b"
 echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
 echo '----------------------------------------------------------------------'
 echo '----------------------------------------------------------------------'
 echo '!'
 echo '!'
 echo '!'
 echo '!'
 a=`expr $a + 100`
 b=`expr $b + 100` 
 done
#ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":1,"FF_end_evi_ID":2}' --tags delete_policy
