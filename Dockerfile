# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "tdang@mail.com"

# tell docker what port to expose
EXPOSE 8000