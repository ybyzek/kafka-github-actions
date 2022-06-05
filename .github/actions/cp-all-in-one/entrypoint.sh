#!/bin/sh

echo "input_project: $INPUT_PROJECT"

wget -O docker-compose.yml https://raw.githubusercontent.com/confluentinc/cp-all-in-one/$INPUT_GITHUB_BRANCH_VERSION/cp-all-in-one/docker-compose.yml
docker-compose -p $INPUT_PROJECT up -d $INPUT_SERVICE
sleep 20
