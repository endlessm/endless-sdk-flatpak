kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

sources:
- kind: git_tag
  url: github_com:cython/cython
  track: 0.29.x
  ref: 0.29.15-13-g9cda69e9190992a8dd4508fc085d227692831dd6
