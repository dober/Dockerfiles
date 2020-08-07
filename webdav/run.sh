#!/usr/bin/env bash

htpasswd -bc /etc/apache2/webdav.password "$USERNAME" "$PASSWORD"
chown root:www-data /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password

apache2 -D FOREGROUND
