#!/bin/bash

#
# https://github.com/mattcrooke/docker/tree/master/centos-openjdk-tomcat/8.5.6
#
set -e

echo 'Starting Tomact...'

cd $TOMCAT_HOME/bin
catalina.sh run
