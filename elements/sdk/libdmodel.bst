kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- freedesktop-sdk.bst:components/libarchive.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst
- gnome-sdk.bst:sdk/libsoup.bst
- sdk-depends/eos-shard.bst
- sdk-depends/libzim-glib.bst
- sdk-depends/xapian-glib.bst
- sdk/eos-sdk.bst

sources:
- kind: git_tag
  url: github_com:endlessm/libdmodel.git
  track: sdk-6
