FROM ubuntu:trusty
MAINTAINER Ashley Beecher <ashley.beecher@gmail.com>

ENV TERM=xterm-256color

RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

RUN apt-get update && \
    apt-get install python python-virtualenv libpython2.7 python-mysqldb -y


RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade  

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]  

LABEL application=todobackend    