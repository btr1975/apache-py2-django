# Base Apache2 Server for Running Django Apps
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      important-stopping-note="Stop the server by running apache2ctl stop, this will keep from process hang" \
      description="This is a base Apache2, Python 2.7.12, Python MySQL-python, and mod_wsgi web server for Django." \
      image-version="1.2" \
      django-version="1.11.2" \
      django-localflavor-version="1.5.1" \
      mysql-python-version="1.2.5"

# Copies the apache conf python script

COPY  ./apache-site-conf.py /bin/

# Arguments for Apache conf file builder script if not used, they will use default settings
# SITE_SERVER_NAME = ServerName
# SITE_SERVER_ADMIN = ServerAdmin

ARG SITE_SERVER_NAME
ARG SITE_SERVER_ADMIN

# Directory where Django Sites go

WORKDIR /DjangoSites

RUN apt-get update && apt-get install -y apache2 \
    python \
    python-pip \
    python-dev \
    libmysqlclient-dev \
    libapache2-mod-wsgi \
    && apt-get clean \
    && chmod 755 /DjangoSites \
    && chmod 755 /bin/apache-site-conf.py \
    && pip install --upgrade pip \
    && pip install Django==1.11.2 \
    && pip install django-localflavor==1.5.1 \
    && pip install MySQL-python

EXPOSE 80 443

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
