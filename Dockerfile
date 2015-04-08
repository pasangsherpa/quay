FROM ubuntu:14.04
MAINTAINER Pasang Sherpa "pgsherpa12@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y git-core nodejs-legacy npm

# Setup project directory
WORKDIR /mnt/site
ADD app app

# Clean up any files used by apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD['ls']
