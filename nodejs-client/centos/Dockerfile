FROM centos:7

RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:knonomura/CentOS_7/home:knonomura.repo
RUN yum -y install griddb-c-client

RUN yum install -y epel-release
RUN yum install -y nodejs npm
RUN npm install -g n && n 10

RUN npm install griddb_node

WORKDIR /root
RUN wget https://raw.githubusercontent.com/griddb/nodejs_client/master/sample/sample1.js
CMD node sample1.js  239.0.0.1 31999 dockerGridDB admin admin
