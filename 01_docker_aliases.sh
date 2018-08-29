#!/usr/bin/env bash

# docker aliases

# Simply run a command on a given container.
# 
#     docker-quick-run python:2.7-alpine sh

alias docker-quick-run='docker run -it --rm'

# Output docker service logs to stdout
#
#     docker-service-logs-stdout web_celery-worker

docker_service_logs_stdout() {
  docker service logs --timestamps "$1" 2>&1
}
alias docker-service-logs-stdout='docker_service_logs_stdout'
