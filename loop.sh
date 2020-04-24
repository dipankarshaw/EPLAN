#!/bin/sh
a=1
b=25
 until [ $a -ge 750 ]
 do
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b'}' --tags create_config
 a=`expr $a + 25`
 b=`expr $b + 25` 
 done