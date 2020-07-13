kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/libxml2.bst
- gnome-sdk.bst:sdk/gjs.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/libsoup.bst
- sdk-depends/eos-shard.bst
- sdk-depends/xapian-glib.bst

sources:
- kind: git_tag
  url: github_com:endlessm/basin.git
  track: master
