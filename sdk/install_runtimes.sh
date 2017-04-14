#!/bin/bash -e

GNOME_REMOTE_NAME="gnome"
GNOME_REMOTE_URI=" https://sdk.gnome.org/gnome.flatpakrepo"
GNOME_REMOTE="gnome"
GNOME_VERSION="3.24"
RUNTIMES=("org.freedesktop.Platform//1.6" \
          "org.gnome.Platform//${GNOME_VERSION}" \
          "org.gnome.Sdk//${GNOME_VERSION}" \
          "org.gnome.Sdk.Debug//${GNOME_VERSION}")

flatpak remote-add --user --if-not-exists ${GNOME_REMOTE_NAME} ${GNOME_REMOTE_URI}

for runtime in "${RUNTIMES[@]}"; do
  echo "Installing $runtime"
  flatpak install --user $GNOME_REMOTE $runtime || flatpak update --user $runtime
done
