FROM java:8

RUN wget https://github.com/griddb/webapi/releases/download/2.1.0/griddb_webapi-2.1.0-bin.tar.gz
RUN tar xvfz griddb_webapi-2.1.0-bin.tar.gz

ENV GS_WEBAPI_HOME /webapi

RUN set -x && \
sed -i -e s/\"name\"\ :\ \"\"/\"name\"\ :\ \"dockerGridDB\"/g \
$GS_WEBAPI_HOME/conf/repository.json

WORKDIR $GS_WEBAPI_HOME
CMD java -jar lib/griddb-webapi-ce-2.1.0.jar
