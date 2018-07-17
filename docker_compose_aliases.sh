#!/usr/bin/env bash

# docker-compose aliases

# Simply run a command on a given container.
# 
#     docker-compose-quick-run postgres cat /proc/version

alias docker-compose-quick-run='docker-compose run --rm'

# Run a Django management command on a given container.
# 
#     docker-compose-django web makemigrations

docker_compose_django() {
  docker-compose run --rm "$1" python manage.py "${@:2}"
}
alias docker-compose-django='docker_compose_django'


# Recreate a container by killing it and bringing it back up with --force-recreate
# 
#     docker-compose-recreate celery_worker

docker_compose_recreate() {
  docker-compose kill "$1" && docker-compose up --force-recreate -d "$1"
}

alias docker-compose-recreate="docker_compose_recreate"
