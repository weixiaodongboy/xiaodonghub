# 选择一个已有的os镜像作为基础
#FROM centos:7
#FROM redis
#FROM nvbeta/node
#FROM reg.xiaodonghub.com/library/centos_etcd:0.1
FROM reg.xiaodonghub.com/library/nginx:v1.15
# 镜像的作者
MAINTAINER weixiaodongboy@gmail.com
 
# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no
#RUN yum install -y openssh-server sudo 

#RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
 
# 添加测试用户root，密码Huawei12#$，并且将此用户添加到sudoers里
#RUN echo "root:Huawei12#$" | chpasswd
#RUN echo "root  ALL=(ALL)    ALL" >> /etc/sudoers
 
# 下面这两句比较特殊，在centos6上必须要有，否则创建出来的容器sshd不能登录
#RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
 
# 启动sshd服务并且暴露22端口
#RUN mkdir /var/run/sshd
EXPOSE 22
#EXPOSE 2379
#EXPOSE 2380

#RUN yum install wget  -y 
#RUN yum install curl -y
#RUN yum install unzip -y
#RUN yum install iproute -y
#RUN yum install net-tools -y
#RUN yum install git -y

#RUN yum install etcd -y

#RUN yum clean all 
#RUN rm -rf /var/cache/yum/*

RUN apt-get update
RUN apt-get install -y iproute 

#ADD startup /opt
#RUN chmod a+x /opt/startup

#WORKDIR /root/etcd
#CMD ["/root/etcd/myinit.sh","-D"]
#CMD ["/usr/sbin/sshd", "-D"]
#CMD [ "/usr/sbin/init"]

#CMD ["/opt/startup","hello"]
#ENTRYPOINT ["/opt/startup","hello"]
#ENTRYPOINT ["/root/etcd/startup.sh"]
#ENTRYPOINT ["./deploy.sh"]
