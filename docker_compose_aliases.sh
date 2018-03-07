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
