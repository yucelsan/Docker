# Utilise une image officielle Apache + PHP
FROM php:8.2-apache

# Active les modules nécessaires PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copie les fichiers de l'application dans le conteneur
COPY . /var/www/html/

# Active le mod_rewrite Apache
RUN a2enmod rewrite

# Change les permissions
RUN chown -R www-data:www-data /var/www/html

# Expose le PORT 80
EXPOSE 80

# Démarre Apache
CMD ["apache2-foreground"]

# Install Client MySQL & EMACS
RUN apt update && apt install -y default-mysql-client emacs
