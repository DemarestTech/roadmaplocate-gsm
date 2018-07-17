#!/usr/bin/env bash


docker build -t dtech/rml . \
&& docker run -d -p 80:80 dtech/rml
# or docker run -d -p 80:80 tademarest/rml


# To build from git repo: `docker build https://github.com/DemarestTech/roadmaplocate-gsm.git#master:server`
# To run interactively:  `docker run -p 80:80 -it dtech/rml bash`
# To start server at terminal:  `cd /rml/src && openresty -c /rml/src/nginx.conf`



# To post some data with curl do
# `curl -d "param1=value1&param2=value2" -X POST http://localhost:80/post`
