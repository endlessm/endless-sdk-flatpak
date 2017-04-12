FROM ebassi/endless-ci:base
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

ENV FLATPAK_OSTREE_REPO_MODE=user-only

RUN flatpak install gnome \ 
        org.freedesktop.Platform//1.4 \
        org.gnome.Platform//3.22 \
        org.gnome.Platform.Locale//3.22
