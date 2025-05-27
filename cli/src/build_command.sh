#!/usr/bin/env bash

version=${args["version"]}

set -e

docker buildx build --platform linux/amd64 --push \
  -t 590184073526.dkr.ecr.us-east-1.amazonaws.com/javier/cicd-strawman-ui:latest \
  -t 590184073526.dkr.ecr.us-east-1.amazonaws.com/javier/cicd-strawman-ui:"$version" .
