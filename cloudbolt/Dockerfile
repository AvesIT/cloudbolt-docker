FROM avesit/cloudbolt-base:latest
LABEL maintainer="Nils Vogels <n.vogels@aves-it.nl>
ARG VERSION

WORKDIR /root
ENV PATH /usr/local/bin:${PATH}

RUN \
  wget http://downloads.cloudbolt.io/${VERSION}/cloudbolt_installer_${VERSION}.tgz -O installer.tgz && \
  cd /tmp &&
  tar xf installer.tgz &&
  rm -f installer.tgz

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
  tail -f /var/log/cloudbolt/application.log && bash
