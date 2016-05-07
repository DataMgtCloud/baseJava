
FROM datamgtcloud/baseconsul

MAINTAINER Changbing JI version: openjdk-8-jre

COPY startContainer.sh /usr/bin/

COPY docker/consul.d/ /etc/consul.d/

RUN \
  curl -s http://120.52.73.80/central.maven.org/maven2/org/aspectj/aspectjweaver/1.8.6/aspectjweaver-1.8.6.jar -o aspectjweaver-1.8.6.jar && \
  mkdir /opt/jars/ && \
  mv aspectjweaver-1.8.6.jar /opt/jars/

RUN \
  apt-get update && \
  apt-get install -y aptitude openjdk-8-jdk gradle && \
  apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

RUN ln -s $JAVA_HOME /opt/java

COPY dockerBuild /app/
