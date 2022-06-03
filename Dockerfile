FROM python:3.7-slim
  
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -U -r /tmp/requirements.txt

COPY *.py ./

ARG CONFIG
COPY $CONFIG ./librdkafka.config

ARG TOPIC
CMD ./producer.py -f ./librdkafka.config -t $TOPIC && timeout 10 ./consumer.py -f ./librdkafka.config -t $TOPIC
