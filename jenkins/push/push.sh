#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u sompongce16 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_NUMBER sompongce16/$IMAGE:$BUILD_NUMBER
echo "*** Pushing image ***"
docker push sompongce16/$IMAGE:$BUILD_NUMBER
