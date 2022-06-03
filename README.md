# kafka-github-actions

## Setup

Provision a Kafka cluster on [Confluent Cloud](https://www.confluent.io/confluent-cloud/tryfree-v1)

Create [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for:

```shell
CONFLUENT_BOOTSTRAP_SERVERS
CONFLUENT_API_KEY
CONFLUENT_API_SECRET
# Confluent Cloud Schema Registry and AVRO
CONFLUENT_SCHEMA_REGISTRY_URL
CONFLUENT_BASIC_AUTH_USER_INFO
```

See [GitHub workflow](.github/workflows/python-kafka-app.yml) for details

## To Do

- [ ] Schema Registry & AVRO
- [ ] Make data for ML domain (more interesting)
- [ ] Update README
