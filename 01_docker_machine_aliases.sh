#!/usr/bin/env bash

# docker-machine aliases

# Set environment variables for a docker machine.
# 
#     docker-machine-env node-1

docker_machine_env() {
  eval "$(docker-machine env "$1")"
}

alias docker-machine-env="docker_machine_env"
