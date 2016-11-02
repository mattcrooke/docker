#!/bin/bash
set -e

#
# https://github.com/mattcrooke/docker/tree/tomcat/centos-jdk-tomcat/8.5.6
#

echo 'Starting Tomact...'

cd $TOMCAT_HOME/bin
catalina.sh run
