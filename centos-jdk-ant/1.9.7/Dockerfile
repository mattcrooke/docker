#
# Centos 7.1 
# Oracle Java 1.8.0
# Apache Ant 1.9.7
#
# Author: matthewcrooke@gmail.com
# Date: 5th November 2016
#
# build: 
# 	docker build -t centos-jdk-ant:1.9.7 .
#
# usage:
# 	docker run -it centos-jdk-ant:1.9.7
#

FROM centos-jdk:1.8.0_112

MAINTAINER matthewcrooke@gmail.com

# declare the ant version
ENV ANT_VERSION 1.9.7

# set the installation directory we'll use for components
ENV INSTALL_DIR=/usr/local

# declare the ant home
ENV ANT_HOME $INSTALL_DIR/ant

ENV ANT_TGZ_URL https://www.apache.org/dist/ant/binaries//apache-ant-$ANT_VERSION-bin.tar.gz
ENV ANT_KEYS_URL https://www.apache.org/dist/ant/KEYS
ENV ANT_ASC_URL https://www.apache.org/dist/ant/binaries/apache-ant-1.9.7-bin.tar.gz.asc

# set the working directory
WORKDIR $INSTALL_DIR

# install some tools we'll need later
RUN set -x \
	\
	&& yum -y update \
	\
	&& yum -y install tar \ 
	&& yum -y install gzip \ 
	&& yum -y install wget \
	&& yum -y install bash-completion \ 
	\
	&& yum clean all 

# retrieve ant binaries
RUN set -x \
	&& wget -O apache-ant.tar.gz "$ANT_TGZ_URL" \
	&& wget -O KEYS "$ANT_KEYS_URL" \ 
	&& wget -O apache-ant.tar.gz.asc "$ANT_ASC_URL"

# verify the ant binaries
RUN set -x \
	&& gpg --import KEYS \
	&& gpg --verify apache-ant.tar.gz.asc

# install ant
RUN set -x \
	&& tar -xvf apache-ant.tar.gz \ 
	&& ln -s $INSTALL_DIR/apache-ant-$ANT_VERSION $ANT_HOME \ 
	&& chmod +x $ANT_HOME/bin/ant

# remove ant install files
RUN set -x \
	&& rm $INSTALL_DIR/apache-ant.tar.gz \
	&& rm $INSTALL_DIR/KEYS \ 
	&& rm $INSTALL_DIR/apache-ant.tar.gz.asc

# update the path to include ant
ENV PATH $ANT_HOME/bin:$PATH

# start with bash
CMD ["/usr/bin/bash"]
