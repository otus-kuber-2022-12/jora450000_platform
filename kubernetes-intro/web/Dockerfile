FROM httpd:latest
COPY ./my_httpd.conf /usr/local/apache2/conf/httpd.conf
WORKDIR /app
COPY homework.html /app
RUN useradd apache \
  && usermod -u 1001 apache \
  && groupmod -g 1001 apache
RUN chown -R apache:apache /app
EXPOSE 8000
