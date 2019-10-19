kind: autotools

build-depends:
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

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
  track: sdk-6
