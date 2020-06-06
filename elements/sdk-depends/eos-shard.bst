kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst

sources:
- kind: git_tag
  url: github_com:endlessm/eos-shard.git
  track: master
  ref: Release_3.8.1-0-g2e102d668c9280f760cc3d9fcf1572515ae76c64
