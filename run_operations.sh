#!/bin/bash

CONTAINER_ID=$(docker ps | grep postgres | head -n1 | cut -d " " -f1)

docker exec -it $CONTAINER_ID psql -U postgres -d recruitment_system -a -f /home/operations/update.sql
docker exec -it $CONTAINER_ID psql -U postgres -d recruitment_system -a -f /home/operations/delete.sql
