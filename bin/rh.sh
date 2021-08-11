#!/bin/sh
RHUSER="username@REDHAT.COM"
VPN="1 - Red Hat Global VPN"
PASS=$(zenity --title "Red Hat Kerberos Password" --password 2> /dev/null)
$(nmcli connection show --active | grep -q "Red Hat") || nmcli connection up "${VPN}" > /dev/null
echo -n "$PASS" | kinit ${RHUSER}
