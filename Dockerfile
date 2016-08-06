FROM python:2.7-slim

MAINTAINER atiger77

RUN apt-get update && apt-get install -y \
                gcc \
                gettext \
                mysql-client libmysqlclient-dev \
        --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 1.9.8

RUN pip install mysqlclient django=="$DJANGO_VERSION"

ADD web_dionaea /opt/web_dionaea
WORKDIR /opt/web_dionaea

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
