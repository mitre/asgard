#!/bin/bash

export VULCAN_SECRET_DB_PW=$(openssl rand -hex 64)
export VULCAN_SECRET_KEY_BASE=$(openssl rand -hex 64)

set -xe

./gen-heimdall-secrets.sh

docker-compose build

docker-compose run heimdall-web rake db:migrate

docker-compose run vulcan-web rake db:migrate
