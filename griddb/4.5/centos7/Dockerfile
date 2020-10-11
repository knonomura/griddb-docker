FROM centos:7

RUN rpm -ivh https://github.com/griddb/griddb/releases/download/v4.5.1/griddb-4.5.1-1.linux.x86_64.rpm

RUN set -x &&\
su - gsadm -c "gs_passwd admin -p admin"

RUN set -x && \
sed -i -e s/\"clusterName\":\"\"/\"clusterName\":\"dockerGridDB\"/g \
/var/lib/gridstore/conf/gs_cluster.json

COPY start-griddb.sh /
CMD /start-griddb.sh
