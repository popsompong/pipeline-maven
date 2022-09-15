#!/bin/bash

docker login -u sompongce16 -p $PASS
cd ~/workspace/pipeline-docker-maven/jenkins/deploy && docker-compose up -d

