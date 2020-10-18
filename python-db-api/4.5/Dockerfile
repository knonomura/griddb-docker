FROM python:3.6

RUN pip install JayDeBeApi
RUN pip install JPype1==0.6.3

ENV MAVEN_VERSION 3.5.2
ENV MAVEN_BASE=apache-maven-${MAVEN_VERSION}
RUN curl -OL https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz &&\
    tar zxvf ${MAVEN_BASE}-bin.tar.gz && mv $MAVEN_BASE /opt/maven
ENV PATH=$PATH:/opt/maven/bin

RUN apt-get update && apt install -y default-jre

WORKDIR /root
COPY DBAPISample.py /root
RUN mvn dependency:get -Dartifact=com.github.griddb:gridstore-jdbc:4.5.0.1 -Ddest=./gridstore-jdbc.jar
CMD python DBAPISample.py
