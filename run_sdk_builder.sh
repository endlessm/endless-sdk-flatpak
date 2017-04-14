#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <flatpak_cache_dir>"
  exit 1
fi

TARGET_DIR=$(readlink -f ${1})

if [ ! -d "${TARGET_DIR}" ]; then
  mkdir -p "${TARGET_DIR}"
fi

pushd sdk >/dev/null
  docker build -t sdk_builder .
popd >/dev/null

# Make sure that host has fuse kernel module
echo "Ensuring that fuse module is loaded"
modprobe fuse

echo "Running the image"
# Relevant upstream bugs:
# https://github.com/docker/docker/issues/27886
# https://github.com/docker/docker/issues/514
# https://github.com/docker/docker/issues/9448
# https://github.com/flatpak/flatpak/issues/647
# XXX: Remove `--rm` for debugging
docker run -it \
           --privileged \
           --rm \
           -v ${TARGET_DIR%/}:/root/.local/share/flatpak \
           -v /dev:/dev \
           sdk_builder

# Alternative that should work but doesn't
# docker run -it \
#            --cap-add SYS_ADMIN \
#            --cap-add MKNOD \
#            --device /dev/fuse \
#            -v ${TARGET_DIR%/}:/root/.local/share/flatpak \
#            -v /dev:/dev \
#            sdk_builder
