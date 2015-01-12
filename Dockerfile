FROM ubuntu

MAINTAINER Daniel Stankevich

RUN apt-get install -y vim curl git python

ENV LANG en_US.UTF-8

ENTRYPOINT ["vim"]
