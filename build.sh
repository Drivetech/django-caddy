docker build -t django-caddy:0.9.4 0.9.4
docker tag django-caddy:0.9.4 lgatica/django-caddy
docker tag django-caddy:0.9.4 lgatica/django-caddy:0.9.4
docker tag django-caddy:0.9.4 lgatica/django-caddy:latest
docker build -t django-caddy:0.9.3 0.9.3
docker tag django-caddy:0.9.3 lgatica/django-caddy
docker tag django-caddy:0.9.3 lgatica/django-caddy:0.9.3
docker tag django-caddy:0.9.3 lgatica/django-caddy:latest
docker push lgatica/django-caddy
