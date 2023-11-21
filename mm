#!/usr/bin/env bash
# Star docker or start laravel sail

if [[ $# -eq 0 ]]; then
    echo "Obrigatório passar argumentos"
    exit 1
elif [[ $1 = 'start' ]]; then
    echo "Starting docker service"
    sudo systemctl start docker
    exit 0

elif [[ $1 = 'up' ]]; then
    echo "Starting docker container"
    if [[ -f vendor/bin/sail ]]; then
    echo "docker composer up..."
    ./vendor/bin/sail up
    else
    echo "Não temos o docker aqui :C"
    fi
elif [[ $1 = 'down' ]]; then
    echo "Stopping docker container"
    if [[ -f vendor/bin/sail ]]; then
        echo "docker composer down..."
        ./vendor/bin/sail down
    else
        echo "Não temos o docker aqui :C"
    fi

elif [[ $1 = "tinker" ]]; then
    ./vendor/bin/sail tinker

elif [[ $1 = "a" ]]; then
    shift
    ./vendor/bin/sail artisan "$@"

elif [[ $1 = "c" ]]; then
    shift
    ./vendor/bin/sail composer "$@"


elif [[ $1 = "cr" ]]; then
    shift
    ./vendor/bin/sail composer require "$@"


else
    echo "unkown command"
    exit 0
fi

