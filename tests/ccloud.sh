#!/bin/bash

TOPIC=$1

docker run -t -e TOPIC=$TOPIC -e BOOTSTRAP=${CONFLUENT_BOOTSTRAP_SERVERS} -e APIKEY=${CONFLUENT_API_KEY} -e APISECRET=${CONFLUENT_API_SECRET}--name confluent-cli --rm confluentinc/confluent-cli bash -c \
  'confluent context create context-test --bootstrap ${BOOTSTRAP} --api-key ${APIKEY} --api-secret ${APISECRET} && confluent kafka topic consume -b --context context-test $TOPIC' \
  || code=$?; if [[ $code -ne 124 && $code -ne 0 ]]; then exit $code; fi
