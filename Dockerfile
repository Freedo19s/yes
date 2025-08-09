# Utiliser l'image officielle PHP + Apache
FROM php:8.2-apache

# Activer mod_rewrite et permettre .htaccess
RUN a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copier tous les fichiers du projet dans le dossier web Apache
COPY . /var/www/html/

# Donner les bons droits
RUN chown -R www-data:www-data /var/www/html

# Configurer Apache pour écouter sur le port fourni par Render
RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf || true

# Exposer un port par défaut (Render remplacera avec PORT)
EXPOSE 80

# Lancer Apache normalement
CMD ["apache2-foreground"]
