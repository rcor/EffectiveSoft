FROM nginx:1.27.0-alpine-slim
RUN rm /etc/nginx/conf.d/*
ADD ./conf/default.conf /etc/nginx/conf.d/
ADD ./src/index.html /usr/share/nginx/html/