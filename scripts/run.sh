#!/bin/sh
set -e

echo "Listing /django_backend directory contents:"
ls -l /django_backend

echo "Listing /django_backend/django_backend directory contents:"
ls -l /django_backend/django_backend

gunicorn -b :80 --chdir /django_backend/django_backend django_backend.wsgi:application
