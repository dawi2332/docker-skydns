FROM busybox:latest
MAINTAINER dawi2332@gmail.com

EXPOSE 53

ADD skydns /usr/local/bin/
