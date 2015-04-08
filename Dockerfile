FROM ubuntu:14.04
MAINTAINER Pasang Sherpa "pgsherpa12@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y git-core nodejs-legacy npm

# Setup project directory
WORKDIR /mnt/site

# Bundle app source
COPY app app

# Install app dependencies
RUN cd app && npm install

# Clean up any files used by apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE  8080

CMD ["node", "app/index.js"]
