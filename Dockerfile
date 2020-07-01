FROM wordpress:4.9.1-apache

WORKDIR /var/www/html

COPY application-insights /wp-content/plugins
COPY html/wp-content/themes /wp-content/themes
COPY html/wp-config.php .

RUN chown -R www-data:www-data /var/www/html/

CMD ["apache2-foreground"]