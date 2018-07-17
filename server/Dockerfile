FROM ubuntu

MAINTAINER Ty Demarest <ty@demarest.tech>

# TO BUILD DO
# `docker build --build-arg build_pg_password=<database_pwd> .`

## ============ COPY OVER AND RUN INSTALL.SH ============ ##
COPY install.sh /rml/scripts/install.sh
RUN chmod +x /rml/scripts/install.sh \
&& /rml/scripts/install.sh


## ============ COPY WEB API ============ ##
COPY api/ /rml/api/



    
## ============ API SETUP ============ ##

# ------ SHD Users and Listings DATABASEs ----- #


EXPOSE 22 80 # 443
# Note: if manager, open 80/443/5432

#COPY shd_api/run.sh /shuttledog/shd_api/run.sh
#CMD "/shuttledog/shd_api/run.sh"
