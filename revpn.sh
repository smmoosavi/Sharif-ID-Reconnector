#!/usr/bin/env bash

name=$1


uuid=$(nmcli con | grep $name | awk '{print $2}')
while [ "true" ]
do
	VPNCON=$(nmcli con show --active)
	if [[ $VPNCON != *$name* ]]; then
		echo "Disconnected, trying to reconnect..."
		(sleep 1s && nmcli con up uuid $uuid)
	else
		echo -n .
	fi
	sleep 3
done

