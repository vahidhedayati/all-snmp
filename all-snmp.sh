#!/bin/bash

snmpwalk -v2c -c public localhost 1.3.6.1.2

# or to go through specific keys /usr/share/snmp/mibs/HOST-RESOURCES-MIB.txt - done below

for checks in $(cat /usr/share/snmp/mibs/HOST-RESOURCES-MIB.txt |grep "^hr"|awk '{print "HOST-RESOURCES-MIB::"$1}'); do
 echo "--------------------------------------------------------------"
 echo "Checking $checks"
 snmpwalk -v2c -c public  -Oq  localhost  $checks
 echo -e "-------------------------------------------------------------\n\n"
done

