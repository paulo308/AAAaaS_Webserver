#!/bin/sh

# Log the resulting configuration file
cat /etc/nginx/conf.d/default.conf

# Start nginx
service nginx start
