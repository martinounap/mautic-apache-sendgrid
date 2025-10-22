FROM mautic/mautic:6-apache
WORKDIR /var/www/html/
# Add the SendGrid API transport; ignore platform reqs and skip scripts (no npm needed)
RUN sh -c ls -la
RUN cat composer.json
RUN COMPOSER_ALLOW_SUPERUSER=1 composer require symfony/sendgrid-mailer --no-interaction --no-progress --ignore-platform-reqs --no-scripts
WORKDIR /var/www/html
RUN php bin/console cache:clear
RUN chown -R www-data:www-data /var/www/html/var/
