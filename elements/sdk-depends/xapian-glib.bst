kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- sdk-depends/xapian-core.bst

sources:
- kind: git_tag
  url: github_com:endlessm/xapian-glib
  track: master
