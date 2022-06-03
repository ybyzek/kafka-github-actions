## Welcome

[GitHub Actions](https://docs.github.com/en/actions) for Apache Kafka client applications!

## Setup

1. Provision a Kafka cluster on [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1)

2. Create [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for:

```shell
# Confluent Cloud Kafka cluster
CONFLUENT_BOOTSTRAP_SERVERS
CONFLUENT_API_KEY
CONFLUENT_API_SECRET
# Confluent Cloud Schema Registry
CONFLUENT_SCHEMA_REGISTRY_URL
CONFLUENT_BASIC_AUTH_USER_INFO
```

3. See [GitHub workflow](.github/workflows/python-kafka-app.yml) for details
