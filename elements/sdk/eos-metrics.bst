kind: autotools

build-depends:
- freedesktop-sdk.bst:components/python3-dbusmock.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/pygobject.bst
- freedesktop-sdk.bst:components/python3-dbus.bst

variables:
  conf-local: |
    --disable-gtk-doc \
    --disable-gir-doc

sources:
- kind: git_tag
  url: github_com:endlessm/eos-metrics.git
  track: master
  ref: Release_3.8.4-2-gb9b99b04ac76643943fd603416de9e0bf08db5bb
