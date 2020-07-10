kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_tag
  url: github_com:google/googletest.git
  track: v1.10.x
