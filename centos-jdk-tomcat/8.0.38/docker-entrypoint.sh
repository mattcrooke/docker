#!/bin/bash
set -e

echo 'Starting Tomact...'

cd $TOMCAT_HOME/bin
catalina.sh run