FROM debian:stretch-slim
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends \
        json-glib-tools \
        locales \
        make && \
    rm -rf /usr/share/doc/* /usr/share/man/*

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8
