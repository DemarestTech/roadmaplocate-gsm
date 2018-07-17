#!/usr/bin/env bash


ssh -t root@159.203.110.75 "docker build https://github.com/DemarestTech/roadmaplocate-gsm.git#master:server && docker run -d -p 80:80 dtech/rml"