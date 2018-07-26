# nginx
FROM nginx:1.13-alpine

# add bash
RUN apk update && apk add bash

# change workdir
WORKDIR /usr/share/nginx

# copy files
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/

# conf
# RUN rm -rf /etc/nginx/conf.d
# COPY conf /etc/nginx

# entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# launch !
CMD [ "/docker-entrypoint.sh" ]