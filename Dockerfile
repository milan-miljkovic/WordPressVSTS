FROM wordpress:4.9.1-apache AS demo

ADD html/wp-content/themes/ /var/www/html/wp-content/themes
ADD application-insights/ /var/www/html/wp-content/plugins
COPY ["html/wp-config.php", "/var/www/html/"]

RUN chown -R www-data:www-data /var/www/html/

ENTRYPOINT ["apache2-foreground"]