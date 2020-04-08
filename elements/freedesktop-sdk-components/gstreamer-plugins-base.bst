# Replaces sdk/gstreamer-plugins-base.bst from freedesktop-sdk.
# <https://gitlab.com/freedesktop-sdk/freedesktop-sdk/blob/19.08/elements/components/gstreamer-plugins-base.bst>

# Changes from upstream:
# - Use only egl and gles2 on arm.

kind: meson

build-depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/git-minimal.bst
- freedesktop-sdk.bst:components/gtk-doc.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/orc.bst
- freedesktop-sdk.bst:components/gstreamer.bst
- freedesktop-sdk.bst:components/pango.bst
- freedesktop-sdk.bst:components/xorg-lib-xv.bst
- freedesktop-sdk.bst:components/libogg.bst
- freedesktop-sdk.bst:components/libtheora.bst
- freedesktop-sdk.bst:components/libvorbis.bst
- freedesktop-sdk.bst:components/opus.bst
- freedesktop-sdk.bst:components/gdk-pixbuf.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/iso-codes.bst
- freedesktop-sdk.bst:components/alsa-lib.bst
- freedesktop-sdk.bst:components/sdl2.bst

variables:
  (?):
  - arch == "i686":
      gl-api: opengl
      gl-platform: egl,glx
  - arch == "arm":
      gl-api: gles2
      gl-platform: egl
  - arch != "i686" and arch != "arm" and arch != "aarch64":
      gl-api: opengl,gles2
      gl-platform: egl,glx

  meson-local: >-
    -Dgl_api=%{gl-api}
    -Dgl_platform=%{gl-platform}
    -Dintrospection=enabled
    -Dpackage-origin="endless-sdk"
    -Dcdparanoia=disabled
    -Dgl-graphene=disabled
    -Dlibvisual=disabled
    -Dtremor=disabled
    -Dexamples=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstfft-1.0.so'
        - '%{libdir}/libgstrtp-1.0.so'
        - '%{libdir}/libgstsdp-1.0.so'
        - '%{libdir}/libgstvideo-1.0.so'
        - '%{libdir}/libgstapp-1.0.so'
        - '%{libdir}/libgstriff-1.0.so'
        - '%{libdir}/libgstrtsp-1.0.so'
        - '%{libdir}/libgstallocators-1.0.so'
        - '%{libdir}/libgsttag-1.0.so'
        - '%{libdir}/libgstaudio-1.0.so'
        - '%{libdir}/libgstpbutils-1.0.so'
        - '%{libdir}/libgstgl-1.0.so'
        - '%{libdir}/gstreamer-1.0/include'
        - '%{libdir}/gstreamer-1.0/include/**'

config:
  install-commands:
    (>):
    - rm %{install-root}%{includedir}/GL/glext.h
    - rm %{install-root}%{includedir}/KHR/khrplatform.h

sources:
- kind: git_tag
  url: gitlab_freedesktop_org:gstreamer/gst-plugins-base.git
  # Changed to track git commit from upstream bst
  # track: '1.16'
  track: '9d3581b2e6f12f0b7e790d1ebb63b90cf5b1ef4e'
  submodules:
    common:
      checkout: false
      url: gitlab_freedesktop_org:gstreamer/common.git
  ref: 1.16.2-0-g9d3581b2e6f12f0b7e790d1ebb63b90cf5b1ef4e
- kind: git_tag
  url: gitlab_freedesktop_org:gstreamer/meson-ports/gl-headers.git
  directory: subprojects/gl-headers
  track: master
  ref: 5c8c7c0d3ca1f0b783272dac0b95e09414e49bc8

