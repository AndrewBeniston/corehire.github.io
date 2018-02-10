FROM wordpress:4.9.3-php7.2-apache

# Monkey patch the original image

# Gotta fix HTTPS >.>
RUN echo "<? if (\$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') { \$_SERVER['HTTPS'] = 'on'; } ?>" >> /tmp/file && \
    cat /usr/src/wordpress/wp-config-sample.php >> /tmp/file && \
    cp /tmp/file /usr/src/wordpress/wp-config-sample.php

# Gotta fix GZIP, too >.>
RUN sed -i 's|</VirtualHost>||' /etc/apache2/sites-enabled/000-default.conf && \
    echo "    # Set no-cache as default caching strategy to avoid heuristics stupidity" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "    Header setIfEmpty Cache-Control \"public, no-cache\"" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "    # Fix etags w/ mod_deflate >.>" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "    Header edit \"ETag\" \"^(.*)-gzip(\\\"?)$\" \"\$1\$2\"" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "    RequestHeader unset If-Modified-Since" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "</VirtualHost>" >> /etc/apache2/sites-enabled/000-default.conf && \
    echo "" >> /etc/apache2/sites-enabled/000-default.conf && \
    ln -sf /etc/apache2/mods-available/headers.* /etc/apache2/mods-enabled/


COPY theme /var/www/html/wp-content/themes/remarkable

RUN mkdir /var/www/html/wp-content/themes/remarkable_dev
VOLUME /var/www/html/wp-content/themes/remarkable_dev