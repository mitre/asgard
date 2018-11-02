# Asgard

## Warning

Please only run this on localhost.

## Cloning
Clone with `git clone https://github.com/aaronlippold/asgard --recurse-submodules` to also clone the submodules

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

## NOTICE

© 2018 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

## NOTICE
This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.


