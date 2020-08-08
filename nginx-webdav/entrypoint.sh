#!/usr/bin/env bash

if [[ -n "$USERNAME" ]] && [[ -n "$PASSWORD" ]]
then
    mkdir -p /etc/nginx/htpasswd
	htpasswd -bc /etc/nginx/htpasswd/admin.password "$USERNAME" "$PASSWORD"
    touch /etc/nginx/htpasswd/user.password
	echo Done.
else
    echo Using no auth.
	sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
	sed -i 's%auth_basic_user_file admin.password% %g' /etc/nginx/conf.d/default.conf
fi

envsubst '${WEBDAV_PATH}' < /etc/nginx/conf.d/webdav.conf.template > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
