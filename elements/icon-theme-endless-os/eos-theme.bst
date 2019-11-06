kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:core-deps/intltool.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/librsvg.bst

variables:
  conf-local: |
    --enable-app-icons \
    --disable-fonts \
    --disable-settings \
    --disable-faces

sources:
- kind: git_tag
  url: github_com:endlessm/eos-theme.git
  track: master
  ref: Release_3.7.3-8-ge6f787bc4e4fd0b62b70993eebc370422199e77c
