FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app/jupyterhub

RUN apt-get upgrade -y && apt-get update -y && apt-get install -y python3-pip wget curl && pip3 install --upgrade pip

RUN apt-get install npm nodejs -y && \
    npm install -g configurable-http-proxy

RUN pip3 install jupyterhub && \
    pip3 install jupyterlab notebook && \
    pip3 install pandas numpy

RUN useradd master && echo master:master | chpasswd && mkdir /home/master && chown master:master /home/master

ADD jupyterhub_config.py /app/jupyterhub/jupyterhub_config.py
ADD new-user.py /app/jupyterhub/new-user.py

RUN mkdir -p /srv/shared && \
    chown root /srv/shared && \
    chmod 777 /srv/shared && \
    chmod g+s /srv/shared && \
    ln -s /srv/shared /etc/skel/shared

CMD ["jupyterhub","--ip=0.0.0.0","--port=8088","--no-ssl"]

EXPOSE 8088