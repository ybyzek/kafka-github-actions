FROM python:3.7-slim
  
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -U -r /tmp/requirements.txt

COPY *.py ./

ARG CONFIG
RUN echo CONFIG is $CONFIG
COPY $CONFIG ./librdkafka.config

ARG TOPIC
ENV TOPIC ${TOPIC}
RUN echo TOPIC is $TOPIC
CMD ./producer.py -f ./librdkafka.config -t $TOPIC && timeout 10 ./consumer.py -f ./librdkafka.config -t $TOPIC
