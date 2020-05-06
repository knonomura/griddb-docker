FROM centos:7

RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release wget
RUN yum -y install golang
RUN yum -y install pcre-devel

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:knonomura/CentOS_7/home:knonomura.repo
RUN yum -y install griddb-c-client

RUN wget https://prdownloads.sourceforge.net/swig/swig-3.0.12.tar.gz
RUN tar xvfz swig-3.0.12.tar.gz
RUN cd swig-3.0.12 && ./configure && make && make install

ENV GOPATH /root
RUN go get -d github.com/griddb/go_client
RUN cd $GOPATH/src/github.com/griddb/go_client && ./run_swig.sh && go install

WORKDIR $GOPATH/src/github.com/griddb/go_client
CMD go run sample/sample1.go  239.0.0.1 31999 dockerGridDB admin admin