kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

sources:
- kind: git_tag
  url: github_com:cython/cython
  track: 0.29.x
  ref: 0.29.15-10-ge3f413bfe0476106bf33dc7fce0431c7703c6c25
