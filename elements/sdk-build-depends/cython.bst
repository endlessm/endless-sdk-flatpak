kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

sources:
- kind: git_tag
  url: github_com:cython/cython
  track: 0.29.13
