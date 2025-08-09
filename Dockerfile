# Utiliser l'image officielle PHP + Apache
FROM php:8.2-apache

# Activer mod_rewrite et permettre les fichiers .htaccess
RUN a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copier tous les fichiers du projet dans le dossier web Apache
COPY . /var/www/html/

# Donner les bons droits
RUN chown -R www-data:www-data /var/www/html

# Exposer le port que Render utilisera
EXPOSE 10000

# Lancer Apache sur le port donné par Render
CMD ["bash", "-c", "apache2-foreground -DFOREGROUND -k start -p ${PORT:-10000}"]
