kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst
- sdk-build-depends/python-dbusmock.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- sdk-depends/python-dbus.bst

variables:
  conf-local: |
    --disable-gtk-doc \
    --disable-gir-doc

sources:
- kind: git_tag
  url: github_com:endlessm/eos-metrics.git
  track: sdk-6
  ref: Release_3.3.20-0-gab66c7319c573999740f636555b14b6f658e82c0
