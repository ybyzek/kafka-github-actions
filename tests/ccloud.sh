#!/bin/bash

TOPIC=$1

# Test for 10th message in topic
[[ $(docker run -t -e TOPIC=$TOPIC -e BOOTSTRAP=${CONFLUENT_BOOTSTRAP_SERVERS} -e APIKEY=${CONFLUENT_API_KEY} -e APISECRET=${CONFLUENT_API_SECRET} --name confluent-cli confluentinc/confluent-cli bash -c 'confluent context create context-test --bootstrap ${BOOTSTRAP} --api-key ${APIKEY} --api-secret ${APISECRET} && confluent context use context-test && timeout 10s confluent kafka topic consume -b $TOPIC') =~ '{"count": 9}' ]]
