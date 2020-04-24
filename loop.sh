#!/bin/sh
a=1
b=25
 until [ $a -ge 100 ]
 do
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b'}' --tags create_service
 a=`expr $a + 25`
 b=`expr $b + 25` 
 done

a=1
b=25
 until [ $a -ge 100 ]
 do
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b'}' --tags delete_service
 a=`expr $a + 25`
 b=`expr $b + 25` 
 done