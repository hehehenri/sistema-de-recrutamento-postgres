#!/bin/bash

CONTAINER_ID=$(docker ps | grep postgres | head -n1 | cut -d " " -f1)

docker cp migrations.sql $CONTAINER_ID:/home/migrations.sql
docker cp seeders.sql $CONTAINER_ID:/home/seeders.sql
docker cp fresh.sql $CONTAINER_ID:/home/fresh.sql
docker exec -it $CONTAINER_ID rm -rf /home/seeders
docker cp seeders $CONTAINER_ID:/home/seeders
