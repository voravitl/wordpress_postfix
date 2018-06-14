FROM wordpress:latest
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y postfix syslog-ng
COPY ./*.sh /usr/local/bin/
COPY ./custom.ini /usr/local/etc/php/conf.d/mail.ini
RUN chmod a+x /usr/local/bin/*.sh
RUN cp -f /etc/services /var/spool/postfix/etc/services
ENTRYPOINT ["start-postfix-syslog-ng.sh"]
CMD ["apache2-foreground"]
