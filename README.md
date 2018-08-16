# Asgard

## Warning

Please only run this on localhost.

## Running with Docker

### Building Docker Containers

#### Automated Build Steps
1. `./build.sh`
2. Jump to [Running Docker Containers](#running-docker-containers)

#### Manual Build Steps
1. `docker-compose build`
2. `./gen-heimdall-secrets.sh`
3. `docker-compose run heimdall-web rake db:migrate`
4. `docker-compose run vulcan-web rake db:migrate`
5. Jump to [Running Docker Containers](#running-docker-containers)

### Running Docker Containers

1. `docker-compose up`
2. Navigate to `localhost`
