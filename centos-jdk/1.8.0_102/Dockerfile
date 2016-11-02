#
# Oracle Java 1.8.0 on Centos 7.1 
# https://github.com/mattcrooke/docker/blob/master/centos-jdk/1.8.0_102/Dockerfile
#
# Author: matthewcrooke@gmail.com
# Date: 21st October 2016
#
# build: 
#	docker build -t java:1.8.0_102 .
# usage: 
#	docker run -it java:1.8.0_102
#	# java -version
#
# push:
# 	docker login
# 	docker tag centos-jdk:1.8.0_102 mattcrooke/centos-jdk:1.8.0_102
# 	docker push mattcrooke/centos-jdk:1.8.0_102
#

FROM centos:7.1.1503

MAINTAINER matthewcrooke@gmail.com

# declare the java version
ENV JAVA_VERSION 1.8.0_102

# set the installation directory we'll use for components
ENV INSTALL_DIR=/usr/local

# declare the java home
ENV JAVA_HOME $INSTALL_DIR/java

# add oracle jdk to the image
ADD jdk-8u102-linux-x64.tar.gz $INSTALL_DIR

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

# install java
RUN set -x \
	tar -xvf jdk-8u102-linux-x64.tar.gz \ 
	&& ln -s $INSTALL_DIR/jdk1.8.0_102 $JAVA_HOME \ 
	&& chmod +x $JAVA_HOME/bin/java

# remove java install files
#RUN set -x \
#	&& rm $INSTALL_DIR/jdk-8u102-linux-x64.tar.gz

# update the path to include java
ENV PATH $JAVA_HOME/bin:$PATH

# start with bash
CMD ["/usr/bin/bash"]
