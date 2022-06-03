FROM python:3.7-slim
  
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -U -r /tmp/requirements.txt

COPY *.py ./

ARG CONFIG
COPY $CONFIG ./librdkafka.config

CMD ./producer.py -f ./librdkafka.config -t test1 && timeout 10 ./consumer.py -f ./librdkafka.config -t test1
