FROM nginx:1.27.0-alpine-slim
RUN rm /etc/nginx/conf.d/*
COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./src/index.html /usr/share/nginx/html/