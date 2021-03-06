#!/bin/sh

PASSWORD=$(mktemp -d /tmp/temp-one-time-idXXXXXXXXXXXXX)
rmdir $PASSWORD

KDB=/opt/tivoli/tsm/client/ba/bin/dsmcert.kdb
GSK8CAPICMD=gsk8capicmd_64

rm -f /opt/tivoli/tsm/client/ba/bin/dsmcert.*

$GSK8CAPICMD -keydb -create -db "$KDB" -pw "$PASSWORD" -stash

$GSK8CAPICMD -cert -add -db "$KDB" -format ascii -stashed \
	-label "IPnett Cloud Root CA" \
	-file IPnett-Cloud-Root-CA.pem \

$GSK8CAPICMD -cert -list -db "$KDB" -stashed
