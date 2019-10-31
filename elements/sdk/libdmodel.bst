kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst
- gnome-sdk.bst:sdk/libsoup.bst
- sdk-depends/eos-shard.bst
- sdk-depends/xapian-glib.bst
- sdk/eos-sdk.bst

sources:
- kind: git_tag
  url: github_com:endlessm/libdmodel.git
  track: sdk-6
  ref: 3a9351c415704eadc77c46b79f8d651dc0c4638d
