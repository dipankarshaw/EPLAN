#!/bin/sh

a=1
b=101
Step=100
end=600

echo "
*******************************************************************
Test-Step : 

- configure $end EVPL services without QOS ingress Policy and Egress Policy
- configure them in a batch of $Step 
- verify the no of services created
- Delete all earlier created services 

*******************************************************************"

 until [ $a -ge $end ]
 do
 echo "----------------------------------------------------------------------
 !
 !!
 !!!"
 echo " this loop configure from EVI $a to EVI $b"
 echo "----------------------------------------------------------------------
 !
 !!
 !!!"
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b',"QOS_REQUIRED":'NO'}' --tags create_service
 echo " this loop completed configuration from EVI $a to EVI $b"
 a=`expr $a + $Step`
 b=`expr $b + $Step` 
 done
ansible-playbook EE_ELAN.yml --tags verify_service
a=1
b=100
Step=100
end=600
 until [ $a -ge $end ]
 do
 echo "----------------------------------------------------------------------
 !
 !!
 !!!"
 echo " this loop configure from EVI $a to EVI $b"
 echo "----------------------------------------------------------------------
 !
 !!
 !!!"
 ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":'$a',"FF_end_evi_ID":'$b',"QOS_REQUIRED":'NO'}' --tags delete_service
 echo " this loop completed deletion of EVI $a to EVI $b"
 a=`expr $a + $Step`
 b=`expr $b + $Step` 
 done
ansible-playbook EE_ELAN.yml -e '{"FF_start_evi_ID":1,"FF_end_evi_ID":2}' --tags delete_policy
