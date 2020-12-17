#!/bin/bash

docker build --rm -t debian_ssh .
docker run --rm -d -p 2222:22 debian_ssh