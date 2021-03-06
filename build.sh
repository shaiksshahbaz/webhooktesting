#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t shaikshahbaz/testingbuild:${VERSION} .
docker push shaikshahbaz/testingbuild:${VERSION}
docker -H tcp://10.1.2.184:2375 stop nginx
docker -H tcp://10.1.2.184:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx shaikshahbaz/testingbuild:${VERSION}
echo "---------------------"
