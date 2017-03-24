#!/bin/bash

FDO_SDK_VERSION=1.4
GNOME_SDK_VERSION=3.22

if [[ -z "${TRAVIS_BRANCH}" ]]; then
  TRAVIS_BRANCH=master
fi

flatpak install gnome \
        org.freedesktop.Sdk//${FDO_SDK_VERSION} \
        org.freedesktop.Sdk.Debug//${FDO_SDK_VERSION} \
        org.freedesktop.Sdk.Locale//${FDO_SDK_VERSION} \
        org.freedesktop.Platform//${FDO_SDK_VERSION} \
        org.freedesktop.Platform.Locale//${FDO_SDK_VERSION}

flatpak install gnome \
        org.gnome.Sdk//${GNOME_SDK_VERSION} \
        org.gnome.Sdk.Debug//${GNOME_SDK_VERSION} \
        org.gnome.Sdk.Locale//${GNOME_SDK_VERSION} \
        org.gnome.Platform//${GNOME_SDK_VERSION} \
        org.gnome.Platform.Locale//${GNOME_SDK_VERSION} \

make \
        FDO_RUNTIME_VERSION=${FDO_SDK_VERSION} \
        GNOME_RUNTIME_VERSION=${GNOME_SDK_VERSION} \
        BRANCH=${TRAVIS_BRANCH} \
        REPO=com_endless_sdk
