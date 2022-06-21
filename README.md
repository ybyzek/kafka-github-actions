## README

* [Overview](#overview)
* [Instructions](#instructions)
* [Resources](#resources)

## Overview

This demo uses GitHub Actions for developing and valiating Apache Kafka client application, focusing on a Python producer and consumer using Kafka Python Client, plus examples for testing [schema](schemas/) compatibility using both Python and Java.

The code defines an GitHub Actions workflow [python-kafka-app](.github/workflows/python-kafka-app.yml) with jobs to demonstrate a few capabilities:

- `build`: Build a Docker image for the [Kafka Python client application](src/)
- `unit`: Unit test the app with [rdkafka mock](https://github.com/edenhill/librdkafka/blob/master/src/rdkafka_mock.h)
- `local`: Locally test the app using an action called [cp-all-in-one](.github/actions/cp-all-in-one/) to run Confluent Platform from a [Docker Compose file](https://docs.confluent.io/platform/current/tutorials/build-your-own-demos.html#cp-all-in-one)
- `local-avro`: Locally test the app with Schema Registry and Avro using an action called [cp-all-in-one](.github/actions/cp-all-in-one/) to run Confluent Platform from a [Docker Compose file](https://docs.confluent.io/platform/current/tutorials/build-your-own-demos.html#cp-all-in-one)
- `ccloud`: Test the app to [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1/)
- `ccloud-avro`: Test the app to [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1/) with Confluent Cloud Schema Registry and Avro
- `ccloud-schema-compatibility-python`: Use `SchemaRegistryClient.test_compatibility()` to check a new schema's compatibility to the existing schema in Confluent Cloud Schema Registry
- `ccloud-schema-compatibility-java`: Use Maven's `kafka-schema-registry-maven-plugin` to check a new schema's compatibility to the existing schema in Confluent Cloud Schema Registry

![image](images/jobs-graphic.png)

## Instructions

1. Provision a Kafka cluster, enable Schema Registry and create an API key and secret on [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1/). Use the [quickstart](https://developer.confluent.io/quickstart/kafka-on-confluent-cloud/), [Confluent Terraform Provider](https://registry.terraform.io/providers/confluentinc/confluent/0.9.0), or [ccloud-stack](https://docs.confluent.io/platform/current/tutorials/examples/ccloud/docs/ccloud-stack.html).

2. In your GitHub account, create [Encrypted Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for your Confluent Cloud cluster and credentials:

```shell
# Confluent Cloud Kafka cluster
CONFLUENT_BOOTSTRAP_SERVERS
CONFLUENT_API_KEY
CONFLUENT_API_SECRET
# Confluent Cloud Schema Registry
CONFLUENT_SCHEMA_REGISTRY_URL
CONFLUENT_BASIC_AUTH_USER_INFO
```

3. Fork this repository and push a change to trigger the [workflow](.github/workflows/python-kafka-app.yml).

![image](images/jobs-text.png)

## Ports of cp-all-in-one

Confluent Platform ports from `cp-all-in-one` include:

- ZooKeeper: 2181
- Kafka broker: 9092
- Kafka broker JMX: 9101
- Confluent Schema Registry: 8081
- Kafka Connect: 8083
- Confluent Control Center: 9021
- ksqlDB: 8088
- Confluent REST Proxy: 8082

## Resources

- [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1/): Cloud-native service for Apache Kafka
- [GitHub Actions for ksqlDB](https://github.com/jzaralim/ksqldb-migrations-action): demonstrates schema migrations upon a ksqlDB cluster running in Confluent Cloud
- [Kafka Python Client](https://docs.confluent.io/kafka-clients/python/current/overview.html)
- [GitHub Actions](https://docs.github.com/en/actions)
