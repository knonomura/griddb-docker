FROM centos:7

RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:knonomura/CentOS_7/home:knonomura.repo
RUN yum -y install griddb-c-client

WORKDIR /root
RUN wget https://raw.githubusercontent.com/griddb/c_client/master/client/c/sample/sample1.c
RUN gcc sample1.c -lgridstore
CMD ./a.out 239.0.0.1 31999 dockerGridDB admin admin
