#!/usr/bin/env bash


# or docker build https://github.com/DemarestTech/roadmaplocate-gsm
docker build -t dtech/rml . \
&& docker run -d -p 80:80 dtech/rml

# Or docker run -p 80:80 -it dtech/rml bash
#  && cd /rml/src && openresty -c /rml/src/nginx.conf