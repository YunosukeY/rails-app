#!/bin/bash

case "$1" in
  build)
    sudo rm -rf tmp/cache tmp/db tmp/pids tmp/sockets
    docker-compose build
  ;;
  test)
    sudo rm -rf tmp/cache tmp/db tmp/pids tmp/sockets
    docker-compose run --rm web bash -c "bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails test"
    docker-compose down
  ;;
  up)
    sudo rm -rf tmp/cache tmp/db tmp/pids tmp/sockets
    docker-compose up -d
  ;;
  down)
    docker-compose down
  ;;
  rmi)
    docker-compose down --rmi all
  ;;
  clean)
    sudo rm -rf tmp/cache tmp/db tmp/pids tmp/sockets
    docker-compose down --rmi all
esac