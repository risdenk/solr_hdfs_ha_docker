#!/usr/bin/env bash

set -e

docker-compose down -v || true

docker-compose up -d

echo "Wait for Ambari to be ready"
docker-compose exec ambari bash -c "until nc -w 2 ambari 8080 </dev/null 2>/dev/null; do sleep 1; done"
docker-compose exec ambari bash -c "until nc -w 2 ambari 8440 </dev/null 2>/dev/null; do sleep 1; done"
echo "Ambari Ready!"

docker-compose exec ambari bash -c "(cd /blueprints && ./blueprint.sh)"

docker-compose logs -f || true
docker-compose down -v || true

