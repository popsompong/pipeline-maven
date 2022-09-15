#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

#WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven
#WORKSPACE=/Users/sompong/jenkins_home/workspace/pipeline-docker-maven
WORKSPACE=/Users/sompong/jenkins_home/workspace/pipeline-docker-maven


#docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
#docker run --rm  -v "$PWD/java-app":/app -v "$HOME/.m2":/root/.m2 -w /app maven "$@"
docker run --rm --name maven-buid-jar --platform linux/amd64  -v $WORKSPACE/java-app:/app -v /Users/sompong/.m2:/root/.m2 -w /app maven "$@"
