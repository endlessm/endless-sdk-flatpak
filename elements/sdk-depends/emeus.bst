kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk-sdk/gtk+-3.bst

sources:
- kind: git_tag
  url: github_com:endlessm/emeus.git
  track: master
