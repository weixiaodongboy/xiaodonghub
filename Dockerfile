FROM reg.xiaodonghub.com/welcome/demo:5
MAINTAINER www.ctnrs.com

ENV VERSION=8.0.52

RUN rpm -qa | grep ssh

# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no
RUN yum install -y openssh-server sudo && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# 添加测试用户admin，密码admin，并且将此用户添加到sudoers里
RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "admin  ALL=(ALL)    ALL" >> /etc/sudoers


# 启动sshd服务并且暴露22端口
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


ENV PATH $PATH:/usr/local/tomcat/bin

WORKDIR /usr/local/tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]



