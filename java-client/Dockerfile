FROM java:8

ENV MAVEN_VERSION 3.5.2
ENV MAVEN_BASE=apache-maven-${MAVEN_VERSION}

RUN curl -OL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/${MAVEN_BASE}-bin.tar.gz &&\
    tar zxvf ${MAVEN_BASE}-bin.tar.gz && mv $MAVEN_BASE /opt/maven

ENV PATH=$PATH:/opt/maven/bin

RUN mkdir -p /root/src/main/java/gsSample
RUN wget https://raw.githubusercontent.com/griddb/griddb_nosql/master/docs/sample/program/Sample1.java &&\
    cp Sample1.java /root/src/main/java/gsSample/.
COPY pom.xml /root/.

WORKDIR /root
CMD mvn package exec:java -Dexec.mainClass="gsSample.Sample1" -Dexec.args="239.0.0.1 31999 dockerGridDB admin admin"
