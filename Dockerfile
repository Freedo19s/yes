FROM php:8.2-apache

RUN a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

# Ligne modifiant ports.conf supprimée (car elle pose problème)
# RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf || true
