FROM wordpress:4.9.1-apache

COPY html /var/www/html
COPY application-insights /var/www/html/wp-content/plugins
COPY sshd_config /etc/ssh/

RUN chown -R www-data:www-data /var/www/html/
RUN apk add openssh \
     && echo "root:Docker!" | chpasswd

EXPOSE 80 2222

ENTRYPOINT ["apache2-foreground"]
