#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started\n"
fi

until cd /home/app/web/app
do
    echo "Waiting for server volume..."
    sleep 1
done

echo "PWD"
pwd
gunicorn hello_django.wsgi:application --bind 0.0.0.0:8000

exec "$@"
