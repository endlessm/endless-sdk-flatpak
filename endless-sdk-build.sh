#!/bin/bash

FDO_SDK_VERSION=1.6
GNOME_SDK_VERSION=3.24

if [[ -z "${TRAVIS_BRANCH}" ]]; then
  TRAVIS_BRANCH=master
fi

make \
        FDO_RUNTIME_VERSION=${FDO_SDK_VERSION} \
        GNOME_RUNTIME_VERSION=${GNOME_SDK_VERSION} \
        BRANCH=${TRAVIS_BRANCH} \
        REPO=com_endless_sdk
