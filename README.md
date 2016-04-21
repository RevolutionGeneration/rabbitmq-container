RabbitMQ Dockerfile
===================

RabbitMQ Docker Container

## Start

```
 docker run \ 
  -h rabbitmq.example.com \
  -tid \
  --net=host \
  --name=rabbitmq \
  revgen/rabbitmq-container \
  /bin/bash
``` 

and run start.sh after container starts

change nodename: 
` -e NODENAME=my_node`

change ip address:
` -e NODEIP=127.0.0.1`

change port:
` -e NODEPORT=5672`


## Troubleshoting

check you can telnet to 5672 `telnet localhost 5672`

if not, check rabbitmq-server started and running `docker exec -it CONT_ID /bin/bash` `ps -aux`
 
if not, start it `rabbitmq-server` 