FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget python2.7
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

RUN wget https://github.com/griddb/griddb/releases/download/v4.5.0/griddb_4.5.0_amd64.deb
RUN dpkg -i griddb_4.5.0_amd64.deb

RUN set -x &&\
su - gsadm -c "gs_passwd admin -p admin"

RUN set -x && \
sed -i -e s/\"clusterName\":\"\"/\"clusterName\":\"dockerGridDB\"/g \
/var/lib/gridstore/conf/gs_cluster.json

COPY start-griddb.sh /
CMD /start-griddb.sh
