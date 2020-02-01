kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst

sources:
- kind: git_tag
  url: github_com:endlessm/eos-shard.git
  track: sdk-6
