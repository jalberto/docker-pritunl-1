FROM bitnami/minideb:stretch
MAINTAINER <ja@josealberto.org>

RUN echo "deb http://repo.pritunl.com/stable/apt stretch main" > /etc/apt/sources.list.d/pritunl.list && \
  install_packages gnupg dirmngr && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
  apt-get update && \
  install_packages pritunl iptables

COPY start-pritunl /bin/start-pritunl

EXPOSE 80
EXPOSE 443
EXPOSE 1194
EXPOSE 1194/udp

ENTRYPOINT ["/bin/start-pritunl"]

# CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]
