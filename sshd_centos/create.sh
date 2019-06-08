#!/bin/bash


#etcd01

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$IMAGE_NAME#reg.xiaodonghub.com/library/centos_etcd:0.1#' centos_etcd_1b1.deploy.tmp.yaml



sed -i 's#\$DEPLOY_NAME#etcd01-deployment#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$LABEL_NAME#centos-etcd01#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$SVC_NAME#etcd01-svc#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$PORT#8122#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$TARGETPORT#22#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$NODEPORT#30122#' centos_etcd_1b1.deploy.tmp.yaml


kubectl create -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml 


#etcd02

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$IMAGE_NAME#reg.xiaodonghub.com/library/centos_etcd:0.1#' centos_etcd_1b1.deploy.tmp.yaml



sed -i 's#\$DEPLOY_NAME#etcd02-deployment#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$LABEL_NAME#centos-etcd02#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$SVC_NAME#etcd02-svc#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$PORT#8222#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$TARGETPORT#22#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$NODEPORT#30222#' centos_etcd_1b1.deploy.tmp.yaml


kubectl create -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml

#etcd03

rm -rf centos_etcd_1b1.deploy.tmp.yaml
cp centos_etcd_1b1.deploy.yaml centos_etcd_1b1.deploy.tmp.yaml


sed -i 's#\$IMAGE_NAME#reg.xiaodonghub.com/library/centos_etcd:0.1#' centos_etcd_1b1.deploy.tmp.yaml



sed -i 's#\$DEPLOY_NAME#etcd03-deployment#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$LABEL_NAME#centos-etcd03#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$SVC_NAME#etcd03-svc#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$PORT#8322#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$TARGETPORT#22#' centos_etcd_1b1.deploy.tmp.yaml

sed -i 's#\$NODEPORT#30322#' centos_etcd_1b1.deploy.tmp.yaml


kubectl create -f centos_etcd_1b1.deploy.tmp.yaml

rm -rf centos_etcd_1b1.deploy.tmp.yaml
