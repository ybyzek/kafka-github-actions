FROM docker:stable

RUN apk add --update --no-cache ca-certificates bash build-base curl python-dev py-pip libevent-dev libffi-dev openssl-dev \
  && pip install docker-compose

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
