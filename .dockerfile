FROM debian:buster

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    make \
    cmake \
    libcurl4-openssl-dev \
    libjansson-dev

RUN apt-get install -y curl jq

COPY . /app

WORKDIR /app

# Build the project
RUN cmake .  && \
    make && \
    make install && \
    cp bin/redfishcli /usr/local/bin/redfishcli 
