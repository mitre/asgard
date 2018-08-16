docker load -i images.tar

docker-compose run heimdall-web rake db:migrate

docker-compose run vulcan-web rake db:migrate

docker-compose up
