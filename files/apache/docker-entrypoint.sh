#!/bin/bash

#From https://github.com/docker-library/httpd/blob/master/2.4/httpd-foreground
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

# Change /var/www ownership
echo "Fixing permissions"
chown -R www-data:www-data /var/www

# Start server
echo "Starting server"
exec /usr/sbin/apachectl -DFOREGROUND "$@"
