FROM alpine

WORKDIR /opt

ADD install.sh /opt

RUN sh install.sh

ADD nginx.conf /usr/local/nginx/conf

EXPOSE 80 1935

CMD ["nginx", "-g", "daemon off;"]
