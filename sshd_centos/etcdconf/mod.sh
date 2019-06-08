#!/bin/bash

echo "hello"



if [ -a $6 ]; then
  echo "argvs null, exiting"
  exit
fi

ipaddr=$(ip addr | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')

echo "current_ip = $ipaddr"

if [ "$ipaddr" = "$2" ]; then
  local_name=$1
  local_ip=$2
  peer2_name=$3
  peer2_ip=$4
  peer3_name=$5
  peer3_ip=$6
  echo "in if --1 "
fi

if [ "$ipaddr" = "$4" ]; then
  local_name=$3
  local_ip=$4
  peer2_name=$1
  peer2_ip=$2
  peer3_name=$5
  peer3_ip=$6
  echo "in if --2 "
fi

if [ "$ipaddr" = "$6" ]; then
  local_name=$5
  local_ip=$6
  peer2_name=$1
  peer2_ip=$2
  peer3_name=$3
  peer3_ip=$4
  echo "in if --3 "
fi


echo "args satisfied"
echo "local_name = $local_name"
echo "local_ip = $local_ip"

echo "peer2_name = $peer2_name"
echo "peer2_ip = $peer2_ip"

echo "peer3_name = $peer3_name"
echo "peer3_ip = $peer3_ip"




cp etcd.conf etcd.conf.tmp


sed -i 's#\$ETCD_NAME#'$local_name'#' etcd.conf

sed -i 's#\$LOCAL_IP#'$local_ip'#' etcd.conf

sed -i 's#\$PEER2_NAME#'$peer2_name'#' etcd.conf

sed -i 's#\$PEER2_IP#'$peer2_ip'#' etcd.conf

sed -i 's#\$PEER3_NAME#'$peer3_name'#' etcd.conf

sed -i 's#\$PEER3_IP#'$peer3_ip'#' etcd.conf


cp /root/etcd/etcd.conf /etc/etcd/etcd.conf

cp etcd.conf.tmp etcd.conf

