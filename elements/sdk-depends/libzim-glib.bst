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
  ref: v3.2.0-7-g2190b62217ff44a2c047067e2fd52af5dd0f9d16
