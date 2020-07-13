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
