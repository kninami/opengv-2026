FROM wordpress:6.4-php8.1-apache

RUN a2dismod mpm_event mpm_worker 2>/dev/null; \
    a2enmod mpm_prefork

# opem 폴더 통째로 복사
COPY opem/ /var/www/html/opem/

# 권한 설정
RUN find /var/www/html/opem -type d -exec chmod 755 {} \; && \
    find /var/www/html/opem -type f -exec chmod 644 {} \;

EXPOSE 80