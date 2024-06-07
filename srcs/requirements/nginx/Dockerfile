FROM debian:oldstable

EXPOSE 443

RUN apt-get update && apt-get install -y \
	nginx \
	openssl

COPY ./tools/lunagda.42.fr.crt /etc/nginx/lunagda.42.fr.crt

COPY ./tools/lunagda.42.fr.key /etc/nginx/lunagda.42.fr.key

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/nginx/lunagda.42.fr.key \
	-out /etc/nginx/lunagda.42.fr.crt -sha256 -subj "/CN=prossi.42.fr"

CMD ["nginx", "-g", "daemon off;"]