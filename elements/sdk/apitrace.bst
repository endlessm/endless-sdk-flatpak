kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:components/xorg-lib-x11.bst

sources:
- kind: git_tag
  url: github_com:apitrace/apitrace.git
  track: master
  track-tags: true
  ref: 9.0-0-gcae55f54c53449fd07f8a917dcd0874db2c15032
