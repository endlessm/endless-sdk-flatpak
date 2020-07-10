# Replaces sdk/cogl.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-36/elements/sdk/cogl.bst>

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

# Changes from upstream:
# - Build with --enable-gles2 on 32-bit ARM.

kind: autotools

sources:
- kind: tar
  url: download_gnome_org_sources:cogl/1.22/cogl-1.22.8.tar.xz

build-depends:
- gnome-sdk.bst:sdk/gtk-doc.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/gstreamer.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst
- freedesktop-sdk.bst:components/xorg-lib-xcomposite.bst
- freedesktop-sdk.bst:components/xorg-lib-xdamage.bst
- freedesktop-sdk.bst:components/xorg-lib-xext.bst
- freedesktop-sdk.bst:components/xorg-lib-xfixes.bst
- freedesktop-sdk.bst:components/xorg-lib-xrandr.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/pango.bst
- gnome-sdk-sdk/gst-plugins-base.bst

runtime-depends:
# dummy dependency so this is staged on top of the element from gnome-sdk
- gnome-sdk.bst:sdk/cogl.bst

variables:
  cogl_arch_options: ''
  (?):
  - arch == "arm":
      cogl_arch_options: |
        --enable-gles2
  conf-local: >-
    --disable-cogl-gst
    --disable-maintainer-flags
    --enable-xlib-egl-platform
    --enable-wayland-egl-platform
    --enable-wayland-egl-server
    %{cogl_arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcogl-pango.so'
        - '%{libdir}/libcogl-path.so'
        - '%{libdir}/libcogl.so'
    overlap-whitelist:
    - '**'
