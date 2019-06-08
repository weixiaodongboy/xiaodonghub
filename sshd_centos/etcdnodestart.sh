#!/bin/bash

var=$1
var=${var#*etcd}
var2379=${var#*0}
var="3"$var"22"


var2379="$var2379""2379"

echo "$1"" created"" with $var""--22"" $var2379""--2379"

docker run -itd \
-p "$var":22 \
-p "$var2379":2379 \
--privileged \
-v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ \
--expose 2379 --expose 2380 \
--name $1 reg.xiaodonghub.com/library/centos_etcd:"$2" \
 /usr/sbin/init
docker exec -it $1 bash
