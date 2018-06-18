#!/bin/bash
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ROOT"
set -e

cp $BOTNAME.env .env
cat clickhouse-server-config-header.xml > clickhouse-server-config.xml
cat clickhouse-server-config-$BOTNAME.xml >> clickhouse-server-config.xml

docker-compose -p gongo-bot pull
docker-compose -p gongo-bot build
docker-compose -p gongo-bot up --force-recreate -d
docker-compose -p gongo-bot logs -f --tail 10
