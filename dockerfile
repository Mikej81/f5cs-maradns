FROM ubuntu:16.04 as base

LABEL Author="michael@f5.com"
LABEL System="MaraDNS"

ENV HOME /root
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nano -y \
    && apt-get install dnsutils -y \
    && apt-get install --no-install-recommends apt-utils -y \
    && apt-get install maradns maradns-deadwood -y

COPY mararc /etc/mararc

EXPOSE 53/udp
CMD ["bash"]