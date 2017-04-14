#!/bin/bash -e

# If using manual testing, the dir might already be there
if [ ! -d /opt/endless-sdk-flatpak ]; then
  git clone https://github.com/endlessm/endless-sdk-flatpak /opt/endless-sdk-flatpak
fi

/opt/builder/install_runtimes.sh

cd /opt/endless-sdk-flatpak
make
