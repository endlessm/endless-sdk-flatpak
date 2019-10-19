kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- gnome-sdk.bst:core-deps/libyaml.bst

sources:
- kind: git_tag
  url: github_com:yaml/pyyaml.git
  track: 5.1.2
