#!/bin/bash

docker compose down
docker compose pull
docker compose up -d

#docker system prune -a -f

docker ps
