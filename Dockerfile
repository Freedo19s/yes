# Utilise l'image officielle PHP avec Apache
FROM php:8.2-apache

# Active le module Apache pour réécrire les URL (utile si besoin)
RUN a2enmod rewrite

# Copie tous les fichiers du projet dans le dossier web de Apache
COPY . /var/www/html/

# Donne les droits d'écriture à Apache sur credentials.txt
RUN chown -R www-data:www-data /var/www/html \
    && chmod 664 /var/www/html/credentials.txt

# Port par défaut de Apache
EXPOSE 80
