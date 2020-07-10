kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- gnome-sdk.bst:sdk/vala.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- sdk-depends/libzim.bst

sources:
- kind: git_tag
  url: github_com:birros/libzim-glib
  track: master
