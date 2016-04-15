# Jenkins.
FROM ubuntu:14.04
MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Enable the Ubuntu multiverse repository.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse">> /etc/apt/source.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list

# Install Dependencies.
RUN apt-get update && apt-get install -y vim-nox git wget

# Install Erlang
WORKDIR /tmp
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang

# Install RabbitMQ
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
RUN wget -O- https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y rabbitmq-server

# Configure RabbitMQ
COPY conf/ /etc/rabbitmq/

# Startup Script and Ports
WORKDIR ~
COPY start.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start.sh

EXPOSE 5672

CMD ["/usr/local/bin/start.sh"]


