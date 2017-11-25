# django-caddy

[![dockeri.co](http://dockeri.co/image/lgatica/django-caddy)](https://hub.docker.com/r/lgatica/django-caddy/)

[![Build Status](https://travis-ci.org/lgaticaq/django-caddy.svg?branch=master)](https://travis-ci.org/lgaticaq/django-caddy)

> Docker Image for reverse proxy django apps with caddyserver and alpine linux

Supported tags and respective Dockerfile links

- 0.10.9, latest ([Dockerfile](https://github.com/lgaticaq/django-caddy/blob/master/Dockerfile))

## Instructions

```bash
docker create volume --name static
docker create volume --name media
docker create volume --name logs
docker run -d --name django -v static:/path/to/static -v media:/path/to/media -e PORT 8000 your-django-image-with-gunicorn
docker run -d --name caddy --link django:django -v static:/var/www/static -v media:/var/www/media -v logs:/var/log -e PORT 8000 lgatica/django-caddy
```

docker-compose.yml
```yml
version: '2'
services:
  django:
    image: your-django-image-with-gunicorn
    environment:
      - PORT=8000
    volumes:
      - static:/path/to/static
      - media:/path/to/media
  caddy:
    image: lgatica/django-caddy:latest
    links:
      - django:django
    environment:
      - PORT=8000
    ports:
      - 80:80
    volumes:
      - static:/var/www/static
      - media:/var/www/media
      - logs:/var/log
volumes:
  static:
  media:
  logs:
```
