#!/bin/bash

flatpak install gnome \
        org.freedesktop.Sdk//1.4 \
        org.freedesktop.Sdk.Debug//1.4 \
        org.freedesktop.Sdk.Locale//1.4 \
        org.freedesktop.Platform//1.4 \
        org.freedesktop.Platform.Locale//1.4 \
        org.gnome.Sdk//3.22 \
        org.gnome.Sdk.Debug//3.22 \
        org.gnome.Sdk.Locale//3.22 \
        org.gnome.Platform//3.22 \
        org.gnome.Platform.Locale//3.22 \

make REPO=com_endless_sdk BRANCH=${TRAVIS_BRANCH}
