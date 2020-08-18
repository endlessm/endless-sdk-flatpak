kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- gnome-sdk.bst:sdk/gjs.bst

sources:
- kind: git_tag
  url: github_com:ptomato/jasmine-gjs.git
  track: master
