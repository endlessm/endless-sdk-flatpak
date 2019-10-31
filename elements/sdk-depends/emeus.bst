kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk-sdk/gtk+-3.bst

variables:
  conf-local: |
    --enable-gtk-doc=false

sources:
- kind: git_tag
  url: github_com:endlessm/emeus.git
  track: sdk-6
  ref: Release_3.3.18-0-g6ae2373bd9e652337b6dca3901f3b7c570257c31
