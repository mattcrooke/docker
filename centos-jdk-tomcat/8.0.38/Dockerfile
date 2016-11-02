#
# Centos 7.1 
# Oracle Java 1.8.0
# Apache Tomcat 8.0.38
# https://github.com/mattcrooke/docker/tree/tomcat/centos-jdk-tomcat/8.0.38
#
# Author: matthewcrooke@gmail.com
# Date: 24th October 2016
#
# build: 
# docker build -t centos-jdk-tomcat:8.0.38 .
#
# usage: 
# docker run --name centos-jdk-tomcat8.0.38 -v ~/Documents/Kitematic/centos-jdk-tomcat8.0.38/logs:/usr/local/tomcat/logs -v ~/Documents/Kitematic/centos-jdk-tomcat8.0.38/temp:/usr/local/tomcat/temp -v ~/Documents/Kitematic/centos-jdk-tomcat8.0.38/work:/usr/local/tomcat/work -it -p80:8080 centos-jdk-tomcat:8.0.38
#
# usage: 
# docker exec -it centos-jdk-tomcat8.0.38 /bin/bash
#
# push:
# docker login
# docker tag tomcat:8.0.38 mattcrooke/centos-jdk-tomcat:8.0.38
# docker push mattcrooke/centos-jdk-tomcat:8.0.38
#

FROM centos-jdk:1.8.0_112

MAINTAINER matthewcrooke@gmail.com

# declare the tomcat version
ENV TOMCAT_VERSION 8.0.38

# set the installation directory we'll use for components
ENV INSTALL_DIR=/usr/local

# declare the tomcat home
ENV TOMCAT_HOME $INSTALL_DIR/tomcat
ENV CATALINA_HOME $INSTALL_DIR/tomcat

# tomcat urls
ENV TOMCAT_TGZ_URL http://apache.mirror.amaze.com.au/tomcat/tomcat-8/v8.0.38/bin/apache-tomcat-8.0.38.tar.gz
ENV TOMCAT_KEYS_URL https://www.apache.org/dist/tomcat/tomcat-8/KEYS
ENV TOMCAT_ASC_URL https://www.apache.org/dist/tomcat/tomcat-8/v8.0.38/bin/apache-tomcat-8.0.38.tar.gz.asc
ENV TOMCAT_NATIVE_TGZ_URL http://mirror.ventraip.net.au/apache/tomcat/tomcat-connectors/native/1.2.10/source/tomcat-native-1.2.10-src.tar.gz
ENV TOMCAT_NATIVE_ASC_URL https://www.apache.org/dist/tomcat/tomcat-connectors/native/1.2.10/source/tomcat-native-1.2.10-src.tar.gz.asc

# set the working directory
WORKDIR $INSTALL_DIR

# retrieve tomcat binaries
RUN set -x \
	&& wget -O apache-tomcat.tar.gz "$TOMCAT_TGZ_URL" \
	&& wget -O apache-native-src.tar.gz "$TOMCAT_NATIVE_TGZ_URL" \
	&& wget -O KEYS "$TOMCAT_KEYS_URL" \ 
	&& wget -O apache-tomcat.tar.gz.asc "$TOMCAT_ASC_URL" \
	&& wget -O apache-native-src.tar.gz.asc "$TOMCAT_NATIVE_ASC_URL"

# install tools we'll need to build the native module
RUN set -x \
	\
	&& yum -y update \
	\
	&& yum -y install apr-devel \ 
	&& yum -y install openssl-devel \ 
	\
	&& yum clean all 

# verify the tomcat binaries
RUN set -x \
	&& gpg --import KEYS \
	&& gpg --verify apache-tomcat.tar.gz.asc

# install tomcat
RUN set -x \
	&& tar -xvf apache-tomcat.tar.gz \ 
	&& ln -s $INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION $TOMCAT_HOME \ 
	&& chmod +x $TOMCAT_HOME/bin/*.sh \
	&& rm $TOMCAT_HOME/bin/*.bat

# configure the native module
# see http://tomcat.apache.org/native-doc/

# configure ssl
# see http://tomcat.apache.org/tomcat-8.0-doc/ssl-howto.html

# remove tomcat install files
RUN set -x \
	&& rm $INSTALL_DIR/apache-tomcat.tar.gz \
	&& rm $INSTALL_DIR/KEYS \ 
	&& rm $INSTALL_DIR/apache-tomcat.tar.gz.asc

# update the path to include tomcat
ENV PATH $TOMCAT_HOME/bin:$PATH

# expose tomcat ports
EXPOSE 8080 8443

# setup the data volumes
VOLUME ["/$TOMCAT_HOME/logs"]
VOLUME ["/$TOMCAT_HOME/temp"]
VOLUME ["/$TOMCAT_HOME/work"]

# add docker entry point file
ADD docker-entrypoint.sh /entrypoint.sh

# set execution permissions on the entrypoint
RUN set -x \
	&& chmod +x /entrypoint.sh

# set the working directory
WORKDIR $TOMCAT_HOME

# set the entry point
ENTRYPOINT ["/entrypoint.sh"]

# start tomcat
CMD ["catalina.sh", "run"]
