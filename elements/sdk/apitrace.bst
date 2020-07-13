kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:bootstrap/zlib.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst

sources:
- kind: git_tag
  url: github_com:apitrace/apitrace.git
  track: master
  track-tags: true
