FROM php:8.1-apache

# Instalar dependências de sistema
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    zip \
    unzip \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Configurar e instalar extensões do PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    intl \
    mbstring \
    mysqli \
    pdo_mysql \
    gd \
    zip \
    opcache \
    bcmath \
    curl \
    xml \
    fileinfo

# Ativar módulos necessários do Apache
RUN a2enmod rewrite headers

# Copiar Composer oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar arquivo de configuração do Apache VirtualHost
COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Ajustar permissões para a pasta writable
RUN mkdir -p /var/www/html/writable && chown -R www-data:www-data /var/www/html/writable

EXPOSE 80

CMD ["apache2-foreground"]
