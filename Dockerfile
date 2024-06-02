FROM python:3.11.1-alpine3.17
LABEL maintainer="mariskx"
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./django_backend django_backend

WORKDIR /django_backend
EXPOSE 8050

RUN python -m venv /py && \
    apk add --update --no-cache postgresql-client build-base postgresql-dev && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user


ENV PATH="/py/bin:$PATH"

USER django-user