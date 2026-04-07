#!/bin/bash
docker compose pull
docker compose up -d
docker compose logs -f
docker ps
