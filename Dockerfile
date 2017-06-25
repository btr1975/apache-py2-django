# Base Apache2 Server for Running Django Apps
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      important-stopping-note="Stop the server by running apache2ctl stop, this will keep from process hang" \
      description="This is a base Apache2, Python 2.7.12, Python MySQL-python, and mod_wsgi web server for Django." \
      image-version="1.1" \
      django-version="1.11.2" \
      django-localflavor-version="1.5.1" \
      mysql-python-version="1.2.5"

RUN apt-get update && apt-get install -y apache2 \
    python \
    python-pip \
    python-dev \
    libmysqlclient-dev \
    libapache2-mod-wsgi \
    && apt-get clean \
    && mkdir /DjangoSites \
    && chmod 755 /DjangoSites \
    && pip install --upgrade pip \
    && pip install Django==1.11.2 \
    && pip install django-localflavor==1.5.1 \
    && pip install MySQL-python

EXPOSE 80 443

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
