#!/bin/bash

#etcd01

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$DEPLOY_NAME#etcd01-deployment#' centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$SVC_NAME#etcd01-svc#' centos_etcd_1b1.deploy.tmp.yaml


kubectl delete -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml 


#etcd02

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$DEPLOY_NAME#etcd02-deployment#' centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$SVC_NAME#etcd02-svc#' centos_etcd_1b1.deploy.tmp.yaml



kubectl delete -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml

#etcd03

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$DEPLOY_NAME#etcd03-deployment#' centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$SVC_NAME#etcd03-svc#' centos_etcd_1b1.deploy.tmp.yaml



kubectl delete -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml
