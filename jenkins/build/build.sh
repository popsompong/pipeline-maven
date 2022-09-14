#!/bin/bash

# Copy the new jar to the build location
cp -f java-app/target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

cd /var/jenkins_home/workspace/pipeline-docker-maven/jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
