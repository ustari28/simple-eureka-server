#!/bin/sh
docker build --rm . -t eureka-server:1.0.0
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -d -p 8761:8761 --name eureka-server eureka-server:1.0.0"
