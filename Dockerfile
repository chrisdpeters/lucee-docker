FROM ubuntu:utopic
MAINTAINER Adam Chapman <adam.p.chapman@gmail.com>

# base packages
RUN apt-get update -y && apt-get install -y wget nginx unzip

# install railo
RUN LUCEE_VERSION="4.5.1.000" \
	&& LUCEE_INSTALLER="lucee-$LUCEE_VERSION-pl0-linux-x64-installer.run" \
	&& wget -O /tmp/$LUCEE_INSTALLER http://railo.viviotech.net/downloader.cfm/id/133/file/$LUCEE_INSTALLER \
	&& chmod -R 744 /tmp/$LUCEE_INSTALLER \
	&& /tmp/$LUCEE_INSTALLER --mode unattended --installconn false --installiis false --railopass change_me_to_something_secure \
	&& rm -rf /tmp/$LUCEE_INSTALLER

# make web root
RUN mkdir /var/www
# copy entire contents of App folder into webroot
COPY app/ /var/www/

# nginx config
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/cfwheels-rewrite-rules /etc/nginx/cfwheels-rewrite-rules
COPY nginx/proxy-params /etc/nginx/proxy-params
COPY nginx/default /etc/nginx/sites-enabled/default

# tomcat/lucee config
COPY lucee/web.xml /opt/lucee/tomcat/conf/web.xml
COPY lucee/server.xml /opt/lucee/tomcat/conf/server.xml

# expose http port
EXPOSE 80 8080

# start script
ADD scripts/start.sh /start.sh
RUN chmod +x /start.sh

# start services
CMD "/start.sh"
