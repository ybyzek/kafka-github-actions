#!/bin/bash

TOPIC=$1

echo "CONFLUENT_BOOTSTRAP_SERVERS: $CONFLUENT_BOOTSTRAP_SERVERS"

docker run -t -e TOPIC=$TOPIC -e BOOTSTRAP=${CONFLUENT_BOOTSTRAP_SERVERS} -e APIKEY=${CONFLUENT_API_KEY} -e APISECRET=${CONFLUENT_API_SECRET} --name confluent-cli confluentinc/confluent-cli bash -c \
  'echo "bootstrap: $BOOTSTRAP" && confluent context create context-test --bootstrap ${BOOTSTRAP} --api-key ${APIKEY} --api-secret ${APISECRET} && confluent kafka topic consume -b $TOPIC' \
  || code=$?; if [[ $code -ne 124 && $code -ne 0 ]]; then exit $code; fi
