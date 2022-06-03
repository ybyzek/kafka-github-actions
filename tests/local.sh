#!/bin/bash

[[ $(docker exec broker bash -c 'kafka-console-consumer --bootstrap-server localhost:9092 --topic test1 --from-beginning --max-messages 10 --timeout-ms 10000' 2>&1 | grep "Processed a total of 10 messages") == "Processed a total of 10 messages" ]]
