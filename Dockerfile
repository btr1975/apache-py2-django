# Base Apache2 Server for Running Django Apps
FROM btr1975/apache-py2-django:1.2

LABEL maintainer="e_ben_75-python@yahoo.com" \
      important-stopping-note="Stop the server by running apache2ctl stop, this will keep from process hang" \
      description="This is a base Apache2, Python 2.7.12, Python MySQL-python, and mod_wsgi web server for Django." \
      image-version="1.3" \
      django-version="1.11.2" \
      django-localflavor-version="1.5.1" \
      mysql-python-version="1.2.5"

# Copies the apache conf python script

COPY ./apache-site-conf.sh /bin/

# Arguments for Apache conf file builder script if not used, they will use default settings
# SITE_SERVER_NAME = ServerName
# SITE_SERVER_ADMIN = ServerAdmin

ARG SITE_SERVER_NAME
ARG SITE_SERVER_ADMIN

# Directory where Django Sites go

WORKDIR /DjangoSites

RUN chmod 755 /bin/apache-site-conf.sh

EXPOSE 80 443

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
