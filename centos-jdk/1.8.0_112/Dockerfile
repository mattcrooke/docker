#
# Oracle Java 1.8.0_112 on Centos 7.1 
# https://github.com/mattcrooke/docker/tree/master/centos-jdk/1.8.0_112
#
# Author: matthewcrooke@gmail.com
# Date: 2nd November 2016
#
# build: 
#	docker build -t centos-jdk:1.8.0_112 .
# 
# usage: 
# 	docker run -it centos-jdk:1.8.0_112
#	# java -version
#
# push:
# 	docker login
# 	docker tag centos-jdk:1.8.0_112 mattcrooke/centos-jdk:1.8.0_112
# 	docker push mattcrooke/centos-jdk:1.8.0_112
#

FROM centos:7.1.1503

MAINTAINER matthewcrooke@gmail.com

# declare the java version
ENV JAVA_VERSION 1.8.0_112
ENV JAVA_BUILD 8u112

# declare the java url
ENV JAVA_TGZ_URL http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz

# set the installation directory we'll use for components
ENV INSTALL_DIR=/usr/local

# declare the java home
ENV JAVA_HOME $INSTALL_DIR/java

# set the working directory
WORKDIR $INSTALL_DIR

# install some tools we'll need later
RUN set -x \
	\
	yum -y update \
	\
	&& yum -y install tar \ 
	&& yum -y install gzip \ 
	&& yum -y install wget \
	&& yum -y install bash-completion \ 
	\
	&& yum clean all 

# add oracle jdk to the image (using a local file)
#ADD jdk-${JAVA_BUILD}-linux-x64.tar.gz $INSTALL_DIR

# add oracle jdk to the image (using the internets)
RUN set -x \
	&& wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" -O $INSTALL_DIR/jdk-${JAVA_BUILD}-linux-x64.tar.gz ${JAVA_TGZ_URL}

# install java
RUN set -x \
	&& tar -xvf jdk-${JAVA_BUILD}-linux-x64.tar.gz \
	&& ln -s $INSTALL_DIR/jdk${JAVA_VERSION} $JAVA_HOME \ 
	&& chmod +x $JAVA_HOME/bin/java

# remove java install files
RUN set -x \
	&& rm $INSTALL_DIR/jdk-${JAVA_BUILD}-linux-x64.tar.gz

# update the path to include java
ENV PATH $JAVA_HOME/bin:$PATH

# start with bash
CMD ["/usr/bin/bash"]
