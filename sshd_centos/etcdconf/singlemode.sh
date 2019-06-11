#!/bin/bash

echo "hello"



if [ -a $2 ]; then
  echo "argvs null, exiting"
  exit
fi

ipaddr=$(ip addr | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')

echo "current_ip = $ipaddr"

local_name=$1


local_ip=$2

echo "args satisfied"
echo "local_name = $local_name"
echo "local_ip = $local_ip"

#exit

cp /root/etcd/etcd-single.conf etcd.conf.tmp


sed -i 's#\$ETCD_NAME#'$local_name'#' etcd-single.conf

sed -i 's#\$LOCAL_IP#'$local_ip'#' etcd-single.conf


cp /root/etcd/etcd-single.conf /etc/etcd/etcd.conf
cp /root/etcd/etcd.service /usr/lib/systemd/system/etcd.service
cp etcd.conf.tmp etcd-single.conf
