kind: autotools

build-depends:
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/json-glib.bst
- sdk/eos-metrics.bst

variables:
  conf-local: |
    --disable-gtk-doc \
    --disable-gir-doc \
    --disable-js-doc \
    --disable-webhelper

sources:
- kind: git_tag
  url: github_com:endlessm/eos-sdk.git
  track: master
  ref: Release_3.3.20-67-g426b3f7b1001ee9d8e1d200eb18a308fe825ab0c
