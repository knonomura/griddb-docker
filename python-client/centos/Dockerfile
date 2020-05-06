FROM centos:7

RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:knonomura/CentOS_7/home:knonomura.repo
RUN yum -y install griddb-c-client

RUN yum -y install python36 python36-devel 
RUN pip3 install griddb-python

WORKDIR /root
RUN wget https://raw.githubusercontent.com/griddb/python_client/master/sample/sample1.py
CMD python3 sample1.py 239.0.0.1 31999 dockerGridDB admin admin
