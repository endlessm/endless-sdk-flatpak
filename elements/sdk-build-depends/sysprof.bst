kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/itstools.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:core-deps/libdazzle.bst
- gnome-sdk.bst:core-deps/polkit.bst

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/sysprof.git
  track: sysprof-3-36
