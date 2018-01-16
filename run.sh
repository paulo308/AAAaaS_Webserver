#!/bin/sh

# Log the resulting configuration file
cat /tmp/default.conf


echo starting to built config


echo replacing ___CERT_PATH___/$CERT_PATH
echo replacing ___KEY_PATH___/$KEY_PATH
echo replacing ___PROXY_IP___/$PROXY_IP
echo replacing ___PROXY_PORT___/$PROXY_PORT
echo replacing ___EXTERNAL_PORT___/$EXTERNAL_PORT

sed -i "s@___CERT_PATH___@$CERT_PATH@g" /tmp/default.conf
sed -i "s@___KEY_PATH___@$KEY_PATH@g" /tmp/default.conf
sed -i "s@___PROXY_IP___@$PROXY_IP@g" /tmp/default.conf
sed -i "s@___PROXY_PORT___@$PROXY_PORT@g" /tmp/default.conf
sed -i "s@___EXTERNAL_PORT___@$EXTERNAL_PORT@g" /tmp/default.conf




echo new conf
# Log the resulting configuration file
cat /tmp/default.conf

mv /tmp/default.conf /etc/nginx/conf.d/default.conf


echo new conf on nginx location
cat /etc/nginx/default.conf

nginx -g 'daemon off;'
service nginx start
