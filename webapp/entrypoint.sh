#!/bin/sh

if [ "$DB_CONNECTION" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $DB_HOST $DB_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"

    echo "Applying migrations..."
    python3 craft migrate

fi

if [ "$APP_ENV" = "local" ]
then
    echo "Refreshing the database..."
    python3 craft migrate:refresh  # you may want to remove this
    echo "Applying migrations..."
    python3 craft migrate
    echo "Tables created"
fi

exec "$@"