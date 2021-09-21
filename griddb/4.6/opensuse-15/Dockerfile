FROM opensuse/leap:15.1

RUN zypper install -y wget python2
RUN wget https://github.com/griddb/griddb/releases/download/v4.6.1/griddb-4.6.1-opensuse.x86_64.rpm
RUN rpm -ivh griddb-4.6.1-opensuse.x86_64.rpm

RUN set -x &&\
su - gsadm -c "gs_passwd admin -p admin"

RUN set -x && \
sed -i -e s/\"clusterName\":\"myCluster\"/\"clusterName\":\"dockerGridDB\"/g \
/var/lib/gridstore/conf/gs_cluster.json

COPY start-griddb.sh /
CMD /start-griddb.sh
