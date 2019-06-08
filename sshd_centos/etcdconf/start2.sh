#!/bin/bash
# For machine 2
etcd --data-dir=data.etcd --name machine-2 \
	--initial-advertise-peer-urls http://172.17.88.5:2380 --listen-peer-urls http://172.17.88.5:2380 \
	--advertise-client-urls http://172.17.88.5:2379 --listen-client-urls http://172.17.88.5:2379 \
	--initial-cluster machine-1=http://172.17.88.4:2380,machine-2=http://172.17.88.5:2380,machine-3=http://172.17.88.6:2380 \
	--initial-cluster-state new --initial-cluster-token token-01
