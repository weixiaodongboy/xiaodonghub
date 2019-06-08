#!/bin/bash

cp etcd.conf etcd.conf.tmp

sed -i 's#\$ETCD_NAME#$1#' etcd.conf
#sed -i 's#\$LOCAL_IP#$2#' etcd.conf


#cp etcd.conf.tmp etcd.conf

#sed -i 's#\$SECRET_NAME#${secret_name}#' deploy.v1.yml
