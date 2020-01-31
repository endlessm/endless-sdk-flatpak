kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- gnome-sdk.bst:sdk/gjs.bst

sources:
- kind: git_tag
  url: github_com:ptomato/jasmine-gjs.git
  track: master
  ref: 2.2.1-18-g88c2e56c7e50ab6f51008091e995771bf957fd89
