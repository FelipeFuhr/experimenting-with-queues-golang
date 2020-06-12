#!/bin/bash

docker build -t receiver --no-cache ./receive && \
docker build -t sender --no-cache ./send && \
docker-compose build && \
docker stack deploy --compose-file=docker-compose.yml rmq03