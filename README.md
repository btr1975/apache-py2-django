# Docker-Image: apache-py2-django

## Created By: Benjamin P. Trachtenberg

### Contact Information:  e_ben_75-python@yahoo.com
### If you have any questions e-mail me

### LinkedIn: [Ben Trachtenberg](https://www.linkedin.com/in/ben-trachtenberg-3a78496)
### Docker Hub: [Image](https://hub.docker.com/r/btr1975/apache-py2-django/)

### About

This image is for Python Django Apps written in Python 2

### Image Versions in apache-py2-django:1.1

* Python: 2.7.12
* Apache: 2.4.18 (Ubuntu) with mod_wsgi
* Django: 1.11.2
* Django-Localflavor: 1.5.1
* MySQL-python: 1.2.5

### Image Versions in apache-py2-django:1.2

* Python: 2.7.12
* Apache: 2.4.18 (Ubuntu) with mod_wsgi
* Django: 1.11.2
* Django-Localflavor: 1.5.1
* MySQL-python: 1.2.5
* apache-site-conf.py: 1.0.0.prod

### Image Versions in apache-py2-django:1.3

* Python: 2.7.12
* Apache: 2.4.18 (Ubuntu) with mod_wsgi
* Django: 1.11.2
* Django-Localflavor: 1.5.1
* MySQL-python: 1.2.5
* apache-site-conf.py: 1.0.1.prod
* apache-site-conf.sh: 1.0 prod

### Image Versions in apache-py2-django:1.4

* Added ENV SITE_DIRECTORY_NAME, to bot conf build scripts, to helb build easier

### Docker-Image Version Tags
* latest
* 1.1
* 1.2
* 1.3
* 1.4

#### -- Version News: apache-py2-django:1.3 --
Updated Python script that builds the apache conf file
Added a bash script that builds the apache conf file
Both scripts do the same thing, so use whichever you want.

### Important usage info
```
There are 3 important ENV varibales you should use when using this

ENV SITE_SERVER_NAME
ENV SITE_SERVER_ADMIN
ENV SITE_DIRECTORY_NAME

Set these befor running the apache-site-conf.py, or apache-site-conf.sh script.

```

### Example Dockerfile
```yaml
FROM btr1975/apache-py2-django:1.4

ENV SITE_SERVER_NAME="www.example.com"
ENV SITE_SERVER_ADMIN="admin@example.com"
ENV SITE_DIRECTORY_NAME="SomeDir"

COPY ./SomeDir .

RUN chmod 755 -R /DjangoSites \
    && /bin/apache-site-conf.sh

```

