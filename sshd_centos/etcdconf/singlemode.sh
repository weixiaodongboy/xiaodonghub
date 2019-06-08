#!/bin/bash

echo "hello"



if [ -a $1 ]; then
  echo "argvs null, exiting"
  exit
fi

ipaddr=$(ip addr | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')

echo "current_ip = $ipaddr"

local_name=$1
local_ip=$ipaddr


echo "args satisfied"
echo "local_name = $local_name"
echo "local_ip = $local_ip"

cp /root/etcd/etcd-single.conf etcd.conf.tmp


sed -i 's#\$ETCD_NAME#'$local_name'#' etcd.conf

sed -i 's#\$LOCAL_IP#'$local_ip'#' etcd.conf


cp /root/etcd/etcd-single.conf /etc/etcd/etcd.conf

cp etcd.conf.tmp etcd-single.conf
cp 
