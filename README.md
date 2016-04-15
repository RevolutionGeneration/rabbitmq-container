RabbitMQ Dockerfile
===================

RabbitMQ Docker Container

## Start

```
 docker run \
  -h rabbitmq.example.com \
  -tid \
  --dns=8.8.8.8 \
  -p 5672:5672 \
  revgen/rabbitmq-container \
  /bin/bash
``` 

change nodename: 
` -e NODENAME=my_node`

change ip address:
` -e NODEIP=127.0.0.1`

change port:
` -e NODEPORT=3000`

