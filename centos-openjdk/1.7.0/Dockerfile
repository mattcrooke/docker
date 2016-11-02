#
# OpenJDK 1.7.0 on Centos 7.1 
# https://github.com/mattcrooke/docker/tree/master/centos-openjdk/1.7.0
#
# Author: matthewcrooke@gmail.com
# Date: 2 November 2016
#
# build: 
# docker build -t centos-openjdk:1.7.0 .
#
# usage: 
# docker run -it centos-openjdk:1.7.0
#

FROM centos:7.1.1503

MAINTAINER matthewcrooke@gmail.com

# declare the java version
ENV JAVA_VERSION 1.7.0

# update the yum repositories
RUN set -x \
	&& yum -y update

# install java
RUN set -x \
&& yum -y install java-${JAVA_VERSION}-openjdk-devel

# clean the yum repositories
RUN set -x \
	&& yum clean all 

# start with bash
CMD ["/usr/bin/bash"]
