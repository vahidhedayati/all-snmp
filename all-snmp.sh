#!/bin/bash

for checks in $(cat /usr/share/snmp/mibs/HOST-RESOURCES-MIB.txt |grep "^hr"|awk '{print "HOST-RESOURCES-MIB::"$1}'); do
 echo "--------------------------------------------------------------"
 echo "Checking $checks"
 snmpwalk -v2c -c public  -Oq  localhost  $checks
 echo -e "-------------------------------------------------------------\n\n"
done
