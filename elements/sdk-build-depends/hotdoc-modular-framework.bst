kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- sdk-build-depends/hotdoc.bst

sources:
- kind: git_tag
  url: github_com:endlessm/hotdoc-modular-framework.git
  track: master
