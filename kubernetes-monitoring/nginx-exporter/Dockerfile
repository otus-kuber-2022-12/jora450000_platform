FROM docker.io/lj020326/debian11-systemd 
ENV EXPORTER_VERSION 0.11.0

RUN set -x \
        && apt-get update \
        && apt-get install -y \
                openssl \
                wget \
                libtasn1-6 \
                nginx \
                curl \
                net-tools\
        && rm -rf /var/lib/apt/lists/*
        
RUN set -x \
        && cd /usr/local/bin \
        && wget -q -O nginx-prometheus-exporter.tar.gz "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v${EXPORTER_VERSION}/nginx-prometheus-exporter_${EXPORTER_VERSION}_linux_amd64.tar.gz" \
        && wget -q -O /usr/src/nginx-prometheus-exporter-v$EXPORTER_VERSION.tar.gz "https://github.com/nginxinc/nginx-prometheus-exporter/archive/refs/tags/v${EXPORTER_VERSION}.tar.gz" \
        && tar -xzf nginx-prometheus-exporter.tar.gz \
        && rm -f nginx-prometheus-exporter.tar.gz



#RUN set -x \
#	&& apt-get install -y nginx 
COPY default.conf /etc/nginx/conf.d/
COPY start.sh ./
RUN chmod +x ./start.sh
RUN set -x && nginx -t 
	
#RUN chmod +rx /usr/local/bin/nginx-prometheus-exporter

EXPOSE 8080
EXPOSE 9113
CMD ["./start.sh"]

