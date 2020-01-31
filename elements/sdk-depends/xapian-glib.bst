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
  ref: 1.6.0-27-g7b50cb8f0fdad8ad3297e4c37e321ed254212a43
