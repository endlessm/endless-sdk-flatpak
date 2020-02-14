# Replaces sdk/gjs.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-36/elements/sdk/gjs.bst>

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

# Note that this special version of gjs is only added in the sdk image.

kind: meson

sources:
- kind: tar
  url: download_gnome_org_sources:gjs/1.64/gjs-1.64.4.tar.xz

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/dbus.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/mozjs68.bst
- sdk-build-depends/sysprof.bst

# dummy dependency so this is staged on top of the element from gnome-sdk
runtime-depends:
- gnome-sdk.bst:sdk/gjs.bst

variables:
  meson-local: >-
    -Dprofiler=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgjs.so'
    overlap-whitelist:
    - '**'
