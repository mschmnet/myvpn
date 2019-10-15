#!/bin/bash

set -e

if [[ "$1" == "" ]]
then
  echo "You need to provide a VPN configuration"
  exit 3
else
  vpn_service=$1
fi

if [[ "$2" == "" ]]
then
  echo "Please, introduce your username"
  read username 
else
  username=${2}
fi

if [[ "$3" == "" ]]
then
  echo "Please, introduce your password"
  read -s password
else
  password=${3}
fi


rm -f /tmp/myvpn-fifo
mkfifo /tmp/myvpn-fifo

systemctl stop myvpn@$vpn_service.service
systemctl start myvpn@$vpn_service.service

echo "$username" > /tmp/myvpn-fifo
echo "${password}" > /tmp/myvpn-fifo
