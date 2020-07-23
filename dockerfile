FROM ubuntu:16.04 as base

LABEL Author="michael@f5.com"

LABEL UseCase="Primary DNS in a container."
LABEL description="Primary DNS with MaraDNS in a container, configured to \
    allow zone transfers to F5 Cloud Service DNS."

ENV HOME /root
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends apt-utils -y \
    && apt-get install maradns maradns-deadwood -y

COPY mararc /etc/mararc

EXPOSE 53/udp
EXPOSE 53/tcp
CMD ["bash"]