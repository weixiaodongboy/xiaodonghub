#!/bin/bash

./mod.sh etcd01 172.17.73.4 etcd02 172.17.73.5 etcd03 172.17.73.6
./restart.sh
etcdctl cluster-health
