# Replaces core-deps/poppler.bst from gnome-sdk.

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

kind: cmake

sources:
- kind: tar
  url: https://poppler.freedesktop.org/poppler-0.72.0.tar.xz
- kind: patch
  path: files/poppler/0001-glib-Don-t-create-PopplerInputStream-with-length-0.patch

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/nss.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/openjpeg.bst

# dummy dependency so this is staged on top of the element from gnome-sdk
runtime-depends:
- gnome-sdk.bst:core-deps/poppler.bst

public:
  bst:
    overlap-whitelist:
    - '**'
