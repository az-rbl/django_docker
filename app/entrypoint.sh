#!/bin/sh

if ["$DATABASE"= "postgres"]
then
    echo "Waiting for postgres database..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSql started!"
fi

python manage.py migrate
exec "$@"