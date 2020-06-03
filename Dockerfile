FROM wordpress:4.9.1-apache

COPY html /var/www/html
COPY application-insights /var/www/html/wp-content/plugins

RUN chown -R www-data:www-data /var/www/html/

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:Docker!' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 80 2222
CMD ["/usr/sbin/sshd", "-D"]

ENTRYPOINT ["apache2-foreground"]
