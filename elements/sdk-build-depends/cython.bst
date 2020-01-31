kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

sources:
- kind: git_tag
  url: github_com:cython/cython
  track: 0.29.x
  ref: 0.29.14-0-gbfcaf163e3dcf472ef2af5dec6ac3fffd0d34e66
