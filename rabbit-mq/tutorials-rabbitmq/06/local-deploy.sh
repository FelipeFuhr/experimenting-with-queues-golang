#!/bin/bash

docker build -t client --no-cache ./client && \
docker build -t server --no-cache ./server && \
docker-compose build && \
docker stack deploy --compose-file=docker-compose.yml rmq06