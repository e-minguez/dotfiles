#!/bin/sh
RHUSER="eminguez"
VPN="Raleigh (RDU2)"
#VPN="1 - Red Hat Global VPN"
$(nmcli connection show --active | grep -q "Red Hat") || nmcli connection up "${VPN}" > /dev/null
if ! klist -s 
then
	PASS=$(zenity --title "Red Hat Kerberos Password" --password 2> /dev/null)
	echo -n "$PASS" | kinit -r 7d ${RHUSER}@IPA.REDHAT.COM
	echo -n "$PASS" | kinit -r 7d ${RHUSER}@REDHAT.COM
else
	kinit -R
fi
