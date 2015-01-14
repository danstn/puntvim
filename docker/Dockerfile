FROM ubuntu

MAINTAINER Daniel Stankevich

RUN apt-get install -y vim curl git python

COPY ./vimrc-docker /etc/puntvim/vimrc

ENV LANG en_US.UTF-8

RUN ls /etc/puntvim

ENTRYPOINT ["vim", "-u", "/etc/puntvim/vimrc"]
