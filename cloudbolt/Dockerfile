FROM cloudbolt/cloudbolt:latest
MAINTAINER Rick Kilcoyne <rick@cloudbolt.io>
ARG VERSION

WORKDIR /root
ENV PATH /usr/local/bin:${PATH}
ADD patches/05-guac-dependencies.patch .

RUN \
  wget http://downloads.cloudbolt.io/${VERSION}/cloudbolt_installer_${VERSION}.tgz -O installer.tgz && \
  tar xvf installer.tgz && \
  cd cloudbolt_installer_* && \
  patch 05-guac-dependencies/cb.sh ../05-guac-dependencies.patch && \
  rm -rf 12-python24

RUN \
   cd cloudbolt_installer_* && \
   ./install_cloudbolt.sh force

EXPOSE 80 443

ENTRYPOINT \
  service memcached start && \
  service mysqld start && \
  service httpd start && \
  service crond start && \
  service guacd start && \
  service guacg start && \
  clear && \
  tail -F /var/log/cloudbolt/application.log && bash
