kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_tag
  url: github_com:google/googletest.git
  track: v1.10.x
  ref: release-1.10.0-0-g703bd9caab50b139428cea1aaff9974ebee5742e
