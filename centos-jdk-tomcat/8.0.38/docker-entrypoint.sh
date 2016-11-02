#!/bin/bash

#
# https://github.com/mattcrooke/docker/tree/tomcat/centos-jdk-tomcat/8.0.38
#
set -e

echo 'Starting Tomact...'

cd $TOMCAT_HOME/bin
catalina.sh run
