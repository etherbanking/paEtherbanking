#!/bin/bash

if [[ "$SUDO_USER" == "" ]] ; then
	echo "This script requires elevated privileges."
	sudo $0
	exit;
fi

PLIST=~/Library/LaunchAgents/parity.etherbanking.plist
su $SUDO_USER -c "launchctl stop parity.etherbanking"
su $SUDO_USER -c "launchctl unload $PLIST"
rm -f /usr/local/libexec/parity /usr/local/libexec/uninstall-parity.sh /usr/local/bin/ethstore $PLIST

