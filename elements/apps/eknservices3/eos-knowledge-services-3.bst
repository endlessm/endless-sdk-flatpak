kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/glib.bst
- sdk/libdmodel.bst

sources:
- kind: git_tag
  url: github_com:endlessm/eos-knowledge-services.git
  track: master
  ref: Release_3.3.20-82-gf2a0e02d17dfc536407b34be050da6df6c43b938
