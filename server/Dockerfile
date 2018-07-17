FROM ubuntu

MAINTAINER Ty Demarest <ty@demarest.tech>


## ============ COPY OVER AND RUN INSTALL.SH ============ ##
COPY install.sh /rml/scripts/install.sh
RUN chmod +x /rml/scripts/install.sh \
&& /rml/scripts/install.sh


## ============ COPY WEB API ============ ##
COPY src/ /rml/src/

RUN which openresty
RUN mkdir -p /logs

    
## ============ API SETUP ============ ##

EXPOSE 22 80

CMD cd /rml/src && openresty -c /rml/src/nginx.conf
