#!/bin/sh

if [ "$NODENAME" != "" ] ; then
    sed -ri "s/NODENAME=rabbit/NODENAME=$NODENAME/g" /etc/rabbitmq/rabbitmq-env.conf;
fi


if [ "$NODEIP" != "" ] ; then
    sed -ri "s/NODE_IP_ADDRESS=0.0.0.0/NODE_IP_ADDRESS=$NODEIP/g" /etc/rabbitmq/rabbitmq-env.conf;
fi


if [ "$NODEPORT" != "" ] ; then
    sed -ri "s/NODE_PORT=5672/NODE_PORT=$NODEPORT/g" /etc/rabbitmq/rabbitmq-env.conf;
fi

rabbitmq-server
