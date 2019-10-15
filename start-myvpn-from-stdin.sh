#!/bin/bash

if [[ "$1" == "" ]]
then
  echo "You must provide the VPN's URL" 
  exit 4
else
 url_vpn=$1
fi

if [[ "$2" == "" ]]
then
  echo "Please, introduce your username: "
  read username
else
  username=${2}
fi

echo "Please, introduce your password: "
read -s pass

openconnect --juniper --useragent "Linux" --user="$username" --reconnect-timeout=30 --passwd-on-stdin $url_vpn <<< "$pass"

