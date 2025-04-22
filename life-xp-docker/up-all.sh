#!/bin/bash

set -e

echo "👷 Создаём общую сеть life-xp-net, если не существует..."
docker network create life-xp-net || true

echo "🚀 Запускаем все сервисы с билдингом..."
docker-compose -f docker-compose.yml \
               -f docker-compose.user.yml \
               -f docker-compose.activity.yml \
               -f docker-compose.kafka.yml \
               -f docker-compose.xp.yml \
               up --build
