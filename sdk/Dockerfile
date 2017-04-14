FROM debian:stretch-slim
LABEL maintainers="Emmanuele Bassi<ebassi@gmail.com> Srdjan Grubor<sgnn8@sgnn7.org>"

RUN echo "deb-src http://httpredir.debian.org/debian stretch main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-core \
                                               locales \
                                               make && \
    rm -rf /usr/share/doc/* /usr/share/man/*

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get build-dep -y --no-install-recommends flatpak ostree

RUN mkdir /opt/builder
COPY flatpak-build.sh /opt/builder
RUN chmod +x /opt/builder/flatpak-build.sh

RUN /opt/builder/flatpak-build.sh

COPY install_runtimes.sh /opt/builder
RUN chmod +x /opt/builder/install_runtimes.sh

# Uncomment to have a layer with the runtimes included
# Comment out if you want smaller image but runtimes
# will need to be downloaded on running instance or if
# you will use a mounted volume for runtime storage
# RUN /opt/builder/install_runtimes.sh

COPY build.sh /opt/builder
RUN chmod +x /opt/builder/build.sh

# Entrypoint instead of cmd since we want to build platform/sdk by passing
# different cmd from CLI
ENTRYPOINT ["/bin/sh", "-c", "/opt/builder/build.sh"]
