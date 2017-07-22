# Base Apache2 Server for Running Django Apps - this file is for docker hub auto build
FROM btr1975/apache-py2-django:1.2

LABEL maintainer="e_ben_75-python@yahoo.com" \
      important-stopping-note="Stop the server by running apache2ctl stop, this will keep from process hang" \
      description="This is a base Apache2, Python 2.7.12, Python MySQL-python, and mod_wsgi web server for Django." \
      package-name="apache-py2-django" \
      image-version="1.3" \
      django-version="1.11.2" \
      django-localflavor-version="1.5.1" \
      mysql-python-version="1.2.5"

# Copies the apache conf python script and shell script

COPY ./apache-site-conf.sh /bin/
COPY ./apache-site-conf.py /bin/

# Arguments for Apache conf file builder script if not used, they will use default settings
# Also it will only allow them if there is only one site directory if there
# is more it will use default, and you will need to modify manually
# SITE_SERVER_NAME = ServerName
# SITE_SERVER_ADMIN = ServerAdmin

ARG SITE_SERVER_NAME
ARG SITE_SERVER_ADMIN

# Directory where Django Sites go

WORKDIR /DjangoSites

RUN chmod 755 /bin/apache-site-conf.sh \
    && chmod 755 /bin/apache-site-conf.py

EXPOSE 80 443

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
