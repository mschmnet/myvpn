#!/bin/bash

vpn_conf=$1

if [[ "$vpn_conf" == "" ]]
then
  echo "Configuration of VPN not provided. Exiting..."
  exit 4
else
  source /etc/myvpn/$vpn_conf.conf
fi

if [[ "$myvpn_user" == "" ]] || [[ "$myvpn_pass" == "" ]]
then
  /opt/myvpn/start-myvpn-from-stdin.sh $myvpn_url < /tmp/myvpn-fifo
else
  /opt/myvpn/start-myvpn-from-stdin.sh $myvpn_url "$myvpn_user" <<< "$myvpn_pass" 
fi


