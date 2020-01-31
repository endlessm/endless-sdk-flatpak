kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/json-glib.bst
- gnome-sdk.bst:sdk/WebKitGTK.bst

sources:
- kind: git_tag
  url: github_com:endlessm/maxwell.git
  track: master
  ref: 384f3b0c6ce37002fa9155cbc9bb9c5ddb870fc7
