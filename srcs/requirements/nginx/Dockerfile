FROM debian:oldstable

EXPOSE 443

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN apt update && apt upgrade -y && apt install -y nginx

COPY ./tools/lunagda.42.fr.crt /etc/nginx/lunagda.42.fr.crt

COPY ./tools/lunagda.42.fr.key /etc/nginx/lunagda.42.fr.key

CMD nginx -g 'daemon off;'