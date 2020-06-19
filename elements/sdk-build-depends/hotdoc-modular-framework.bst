kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- sdk-build-depends/hotdoc.bst
- sdk-depends/python3-pyyaml.bst

sources:
- kind: git_tag
  url: github_com:endlessm/hotdoc-modular-framework.git
  track: master
  ref: Release_3.3.20-3-g03121236fa89574a9ee840e5b154363187af58e7
