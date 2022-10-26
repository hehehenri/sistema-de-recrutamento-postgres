#!/bin/bash

CONTAINER_ID=$(docker ps | grep postgres | head -n1 | cut -d " " -f1)

docker exec -it $CONTAINER_ID psql -U postgres -a -f /home/fresh.sql
./run_migrations.sh
