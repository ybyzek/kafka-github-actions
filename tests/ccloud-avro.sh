#!/bin/bash

TOPIC=$1

# Split Confluent Cloud Schema Registry credentials into key and secret
SRAPIKEY=$(echo "${CONFLUENT_BASIC_AUTH_USER_INFO}" | awk -F: '{print $1;}')
SRAPISECRET=$(echo "${CONFLUENT_BASIC_AUTH_USER_INFO}" | awk -F: '{print $2;}')

# Test for 10th message in topic
docker run -t -e TOPIC=$TOPIC -e BOOTSTRAP=${CONFLUENT_BOOTSTRAP_SERVERS} -e APIKEY=${CONFLUENT_API_KEY} -e APISECRET=${CONFLUENT_API_SECRET} -e SRENDPOINT=${CONFLUENT_SCHEMA_REGISTRY_URL} -e SRAPIKEY=$SRAPIKEY -e SRAPISECRET=$SRAPISECRET --name confluent-cli confluentinc/confluent-cli bash -c 'echo "bootstrap: $BOOTSTRAP" && confluent context create context-test --bootstrap ${BOOTSTRAP} --api-key ${APIKEY} --api-secret ${APISECRET} && confluent context use context-test && timeout 10s confluent kafka topic consume --value-format avro --sr-endpoint ${SRENDPOINT} --sr-api-key ${SRAPIKEY} --sr-api-secret ${SRAPISECRET} -b $TOPIC'
[[ $(docker run -t -e TOPIC=$TOPIC -e BOOTSTRAP=${CONFLUENT_BOOTSTRAP_SERVERS} -e APIKEY=${CONFLUENT_API_KEY} -e APISECRET=${CONFLUENT_API_SECRET} -e SRENDPOINT=${CONFLUENT_SCHEMA_REGISTRY_URL} -e SRAPIKEY=$SRAPIKEY -e SRAPISECRET=$SRAPISECRET --name confluent-cli confluentinc/confluent-cli bash -c 'echo "bootstrap: $BOOTSTRAP" && confluent context create context-test --bootstrap ${BOOTSTRAP} --api-key ${APIKEY} --api-secret ${APISECRET} && confluent context use context-test && timeout 10s confluent kafka topic consume --value-format avro --sr-endpoint ${SRENDPOINT} --sr-api-key ${SRAPIKEY} --sr-api-secret ${SRAPISECRET} -b $TOPIC') =~ '{"count": 9}' ]]
