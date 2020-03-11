kind: autotools

build-depends:
- freedesktop-sdk.bst:components/python3-dbusmock.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- freedesktop-sdk.bst:components/python3-dbus.bst

variables:
  conf-local: |
    --disable-gtk-doc \
    --disable-gir-doc

sources:
- kind: git_tag
  url: github_com:endlessm/eos-metrics.git
  track: master
  ref: Release_3.7.8-2-g6b78996c7aa86892227c2ab6cbb8c173f469e4ec
