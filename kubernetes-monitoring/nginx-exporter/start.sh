#!/bin/sh
service nginx start
sleep 5
/usr/local/bin/nginx-prometheus-exporter -nginx.scrape-uri http://127.0.0.1:8080/nginx_status
sh
