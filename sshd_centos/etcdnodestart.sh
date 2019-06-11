#!/bin/bash

var=$1
var=${var#*etcd}
var2379=${var#*0}
var="3"$var"22"


var2379="$var2379""2379"

echo "$1"" created"" with $var""--22"" $var2379""--2379"

docker run -itd \
--network $3 \
-p "$var":22 \
-p "$var2379":2379 \
--privileged \
-v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ \
--expose 2379 --expose 2380 \
--name $1 reg.xiaodonghub.com/library/centos_etcd:"$2" \
 /usr/sbin/init


#docker run -itd --network bridge -p 30122:22 -p 12379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd01 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
#docker run -itd --network net1 -p 30222:22 -p 22379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd02 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
#docker run -itd --network host -p 30322:22 -p 32379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd03 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
#docker run -itd --network none -p 30422:22 -p 42379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd04 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
#docker run -itd --network net2 -p 30522:22 -p 52379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd05 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
#docker run -itd --network net2 -p 30622:22 -p 62379:2379 --privileged -v /root/github/xiaodonghub/sshd_centos/etcdconf:/root/etcd/ --name etcd06 reg.xiaodonghub.com/library/centos_etcd:0.2  /usr/sbin/init
docker exec -it $1 bash
